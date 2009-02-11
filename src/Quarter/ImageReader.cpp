/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2009 by Systems in Motion.  All rights reserved.
 *
 *  This library is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License ("GPL") version 2
 *  as published by the Free Software Foundation.  See the file COPYING
 *  at the root directory of this source distribution for additional
 *  information about the GNU GPL.
 *
 *  For using SIM Quarter with software that can not be combined with
 *  the GNU GPL, and for taking advantage of the additional benefits of
 *  our support services, please contact Systems in Motion about acquiring
 *  a Coin Professional Edition License.
 *
 *  See <URL:http://www.coin3d.org/> for more information.
 *
 *  Systems in Motion AS, Bygdøy allé 5, N-0257 Oslo, NORWAY. (www.sim.no)
 *
\**************************************************************************/

#include "ImageReader.h"
#include <Inventor/SbImage.h>
#include <Inventor/errors/SoDebugError.h>
#include <QtGui/QImage>

#include <Quarter/QtCoinCompatibility.h>

using namespace SIM::Coin3D::Quarter;

ImageReader::ImageReader(void)
{
  SbImage::addReadImageCB(ImageReader::readImageCB, this);
}

ImageReader::~ImageReader(void)
{
  SbImage::removeReadImageCB(ImageReader::readImageCB, this);
}

SbBool
ImageReader::readImage(const SbString & filename, SbImage & sbimage) const
{
  QImage image;
  if (image.load(filename.getString())) {
    int c;
    int w = image.width();
    int h = image.height();

    // Keep in 8-bits mode if that was what we read
    if (image.depth() != 8 || !image.isGrayscale()) {
      // FIXME: consider if we should detect allGrayscale() and alpha (c = 2)
      image = image.convertToFormat(image.hasAlphaChannel() ?
                                    QImage::Format_ARGB32 : QImage::Format_RGB32);
    }

    QtCoinCompatibility::QImageToSbImage(image,sbimage);
    return TRUE;
  }
  return FALSE;
}



SbBool
ImageReader::readImageCB(const SbString & filename, SbImage * image, void * closure)
{
  return ((ImageReader*)closure)->readImage(filename, *image);
}
