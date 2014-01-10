/**************************************************************************\
 * Copyright (c) Kongsberg Oil & Gas Technologies AS
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 * 
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * 
 * Neither the name of the copyright holder nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
\**************************************************************************/

/*!
  This example shows a minimal stand-alone
  example of a QuarterViewer without the use of ui files
 */

#include <QApplication>

#include <Inventor/nodes/SoCone.h>
#include <Inventor/nodes/SoBaseColor.h>
#include <Inventor/nodes/SoSeparator.h>
#include <Inventor/nodes/SoOrthographicCamera.h>
#include <Inventor/nodes/SoText2.h>
#include <Inventor/nodes/SoTranslation.h>
#include <Inventor/nodes/SoBaseColor.h>
#include <Inventor/nodes/SoIndexedFaceSet.h>
#include <Inventor/nodes/SoLightModel.h>
#include <Inventor/nodes/SoCoordinate3.h>
#include <Inventor/nodes/SoMaterialBinding.h>

#include <Inventor/SoRenderManager.h>

#include <Quarter/QuarterWidget.h>
#include <Quarter/Quarter.h>

using namespace SIM::Coin3D::Quarter;

static SoSeparator * create_background(void)
{
  // create a gradient background
  SoSeparator * root = new SoSeparator;
  SoBaseColor * color = new SoBaseColor;
  SoOrthographicCamera * orthocam = new SoOrthographicCamera;

  color->rgb.set1Value(0, SbColor(1.0, 0.0, 0.0));
  color->rgb.set1Value(1, SbColor(1.0, 1.0, 0.0));

  orthocam->height.setValue(1.0);
  orthocam->viewportMapping = SoCamera::LEAVE_ALONE;
  orthocam->nearDistance.setValue(0.0);
  orthocam->farDistance.setValue(2.0);
  orthocam->position = SbVec3f(0.0f, 0.0f, 1.0f);

  SoMaterialBinding * mb = new SoMaterialBinding;
  mb->value = SoMaterialBinding::PER_VERTEX_INDEXED;

  SoCoordinate3 * coords = new SoCoordinate3;
  coords->point.set1Value(0, SbVec3f(-0.5f, -0.5f, 0.0f));
  coords->point.set1Value(1, SbVec3f(0.5f, -0.5f, 0.0f));
  coords->point.set1Value(2, SbVec3f(0.5f, 0.5f, 0.0f));
  coords->point.set1Value(3, SbVec3f(-0.5f, 0.5f, 0.0f));

  SoIndexedFaceSet * ifs = new SoIndexedFaceSet;
  ifs->coordIndex.set1Value(0, 0);
  ifs->coordIndex.set1Value(1, 1);
  ifs->coordIndex.set1Value(2, 2);
  ifs->coordIndex.set1Value(3, 3);
  ifs->coordIndex.set1Value(4, -1);

  ifs->materialIndex.set1Value(0, 0);
  ifs->materialIndex.set1Value(1, 0);
  ifs->materialIndex.set1Value(2, 1);
  ifs->materialIndex.set1Value(3, 1);
  ifs->materialIndex.set1Value(4, -1);

  SoLightModel * lm = new SoLightModel;
  lm->model = SoLightModel::BASE_COLOR;

  root->addChild(orthocam);
  root->addChild(lm);
  root->addChild(color);
  root->addChild(mb);
  root->addChild(coords);
  root->addChild(ifs);

  return root;

}

// create a simple scene displaying some text to be super-imposed on
// the normal scene graph
static SoSeparator * create_superimposition(void)
{
  SoSeparator * root = new SoSeparator;
  SoText2 * text = new SoText2;
  SoBaseColor * color = new SoBaseColor;
  SoOrthographicCamera * orthocam = new SoOrthographicCamera;

  text->string.setValue("Superimposed Scene");
  color->rgb.setValue(SbColor(1.0, 0.0, 0.0));

  orthocam->height.setValue(1.0);
  orthocam->nearDistance.setValue(0.0);
  orthocam->farDistance.setValue(2.0);
  orthocam->position = SbVec3f(0.0f, 0.0f, 1.0f);

  root->addChild(orthocam);
  root->addChild(color);
  root->addChild(text);

  return root;
}

int
main(int argc, char ** argv)
{
  QApplication app(argc, argv);
  // Initializes Quarter (and implicitly also Coin and Qt
  Quarter::init();

  // Make a dead simple scene graph by using the Coin library, only
  // containing a single yellow cone under the scenegraph root.
  SoSeparator * root = new SoSeparator;
  root->ref();

  SoBaseColor * col = new SoBaseColor;
  col->rgb = SbColor(1, 1, 0);
  root->addChild(col);

  root->addChild(new SoCone);

  // Create a QuarterWidget for displaying a Coin scene graph
  QuarterWidget * viewer = new QuarterWidget;
  //set default navigation mode file
  viewer->setNavigationModeFile();
  viewer->setSceneGraph(root);

  // Add some background text
  SoSeparator * background = create_background();
  (void)viewer->getSoRenderManager()->addSuperimposition(background,
                                                         SoRenderManager::Superimposition::BACKGROUND);


  // Add some super imposed text
  SoSeparator * superimposed = create_superimposition();
  (void)viewer->getSoRenderManager()->addSuperimposition(superimposed);

  // Pop up the QuarterWidget
  viewer->show();
  // Loop until exit.
  app.exec();
  // Clean up resources.
  root->unref();
  delete viewer;
  Quarter::clean();

  return 0;
}
