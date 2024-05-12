<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.10.0" doxygen_gitid="ebc57c6dd303a980bd19dd74b8b61c8f3f5180ca">
  <compound kind="class">
    <name>SIM::Coin3D::Quarter::DragDropHandler</name>
    <filename>classSIM_1_1Coin3D_1_1Quarter_1_1DragDropHandler.html</filename>
    <base>QObject</base>
    <member kind="function">
      <type></type>
      <name>DragDropHandler</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1DragDropHandler.html</anchorfile>
      <anchor>a47ea28a44787c4a13e700efbec83157d</anchor>
      <arglist>(QuarterWidget *parent)</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual bool</type>
      <name>eventFilter</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1DragDropHandler.html</anchorfile>
      <anchor>a2c56e404e55fa5f7a43c13582bcbea87</anchor>
      <arglist>(QObject *, QEvent *event)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>SIM::Coin3D::Quarter::EventFilter</name>
    <filename>classSIM_1_1Coin3D_1_1Quarter_1_1EventFilter.html</filename>
    <base>QObject</base>
    <member kind="function">
      <type>const QPoint &amp;</type>
      <name>globalMousePosition</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1EventFilter.html</anchorfile>
      <anchor>a8e95b1d997d40b499cb79970c6033979</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>registerInputDevice</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1EventFilter.html</anchorfile>
      <anchor>a31f2d0b13f37af3e9db8e342ab1179da</anchor>
      <arglist>(InputDevice *device)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unregisterInputDevice</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1EventFilter.html</anchorfile>
      <anchor>ab41cfe5adc1e2b9529983fb2c64a7da3</anchor>
      <arglist>(InputDevice *device)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>eventFilter</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1EventFilter.html</anchorfile>
      <anchor>a211819215e16e80c1cead08ac5991c58</anchor>
      <arglist>(QObject *obj, QEvent *event)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>SIM::Coin3D::Quarter::FocusHandler</name>
    <filename>classSIM_1_1Coin3D_1_1Quarter_1_1FocusHandler.html</filename>
    <base>QObject</base>
  </compound>
  <compound kind="class">
    <name>SIM::Coin3D::Quarter::InputDevice</name>
    <filename>classSIM_1_1Coin3D_1_1Quarter_1_1InputDevice.html</filename>
    <member kind="function">
      <type>void</type>
      <name>setModifiers</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1InputDevice.html</anchorfile>
      <anchor>a46a3ef34cab6504f4ef8c373c92ce658</anchor>
      <arglist>(SoEvent *soevent, const QInputEvent *qevent)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setMousePosition</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1InputDevice.html</anchorfile>
      <anchor>a5214a65dc89ec9f8d4fca7b460bf5c79</anchor>
      <arglist>(const SbVec2s &amp;pos)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setWindowSize</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1InputDevice.html</anchorfile>
      <anchor>ac9692eb5eb6634ec2dbfb47940536c43</anchor>
      <arglist>(const SbVec2s &amp;size)</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual const SoEvent *</type>
      <name>translateEvent</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1InputDevice.html</anchorfile>
      <anchor>a1efc41b8a64682d6973f133941154cd6</anchor>
      <arglist>(QEvent *event)=0</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>SbVec2s</type>
      <name>mousepos</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1InputDevice.html</anchorfile>
      <anchor>af2399c676c95b1068d211921f1a31d0d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>SbVec2s</type>
      <name>windowsize</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1InputDevice.html</anchorfile>
      <anchor>af849e02d9cc9e2489f28540b41566fb8</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>SIM::Coin3D::Quarter::Keyboard</name>
    <filename>classSIM_1_1Coin3D_1_1Quarter_1_1Keyboard.html</filename>
    <base>SIM::Coin3D::Quarter::InputDevice</base>
    <member kind="function" virtualness="virtual">
      <type>virtual const SoEvent *</type>
      <name>translateEvent</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1Keyboard.html</anchorfile>
      <anchor>a31208dd88fbdc4077110d8dbf107ab24</anchor>
      <arglist>(QEvent *event)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>SIM::Coin3D::Quarter::Mouse</name>
    <filename>classSIM_1_1Coin3D_1_1Quarter_1_1Mouse.html</filename>
    <base>SIM::Coin3D::Quarter::InputDevice</base>
    <member kind="function" virtualness="virtual">
      <type>virtual const SoEvent *</type>
      <name>translateEvent</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1Mouse.html</anchorfile>
      <anchor>a9180c69c1206faef175b834bf24959d4</anchor>
      <arglist>(QEvent *event)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>QDesignerCustomWidgetInterface</name>
    <filename>classQDesignerCustomWidgetInterface.html</filename>
  </compound>
  <compound kind="class">
    <name>QGLWidget</name>
    <filename>classQGLWidget.html</filename>
  </compound>
  <compound kind="class">
    <name>QObject</name>
    <filename>classQObject.html</filename>
  </compound>
  <compound kind="class">
    <name>SIM::Coin3D::Quarter::QuarterWidget</name>
    <filename>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</filename>
    <base>QGLWidget</base>
    <member kind="enumeration">
      <type></type>
      <name>RenderMode</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a23a6af30036e0fd4e8cb3de0425ac5d8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>StereoMode</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a262bd9c0c6af1be3cfc361dcc4a68449</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>TransparencyType</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a4220d0627d62da6826c9ba253834235a</anchor>
      <arglist></arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>redraw</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>aad23fad12131cc4553bbf697dc99165f</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="slot" virtualness="virtual">
      <type>virtual void</type>
      <name>seek</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>ae8cfe1ef246cfc6ecb9bde42a549df46</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>setRenderMode</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>ab1b8a0893b64c3b65f3076116aa0da15</anchor>
      <arglist>(RenderMode mode)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>setStereoMode</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a74015c6561c7b41d2e166281dfb28cc5</anchor>
      <arglist>(StereoMode mode)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>setTransparencyType</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>aa26faba2ba8946ce171ba0c9e02a1371</anchor>
      <arglist>(TransparencyType type)</arglist>
    </member>
    <member kind="slot" virtualness="virtual">
      <type>virtual void</type>
      <name>viewAll</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a37bdd7451e8c8287e2d6674512462c1e</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>QuarterWidget</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a4f4d8e1c2c8825fad214312caf2150ef</anchor>
      <arglist>(const QGLFormat &amp;format, QWidget *parent=0, const QGLWidget *shareWidget=0, Qt::WindowFlags f=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>QuarterWidget</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a7b2034a3af868156d2ad1416f9a55cde</anchor>
      <arglist>(QGLContext *context, QWidget *parent=0, const QGLWidget *sharewidget=0, Qt::WindowFlags f=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>QuarterWidget</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>aa11eba0d580be8870e85bbf4dc84e6fe</anchor>
      <arglist>(QWidget *parent=0, const QGLWidget *sharewidget=0, Qt::WindowFlags f=0)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~QuarterWidget</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a704b576bf7cdd82602c5d68acc50c33e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addStateMachine</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a5d39110253ad1af721f66d5cb0bd9afe</anchor>
      <arglist>(SoScXMLStateMachine *statemachine)</arglist>
    </member>
    <member kind="function">
      <type>uint32_t</type>
      <name>getCacheContextId</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>abccccf7cba268a1029521493983b1863</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>QMenu *</type>
      <name>getContextMenu</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a452d867a0056d1a7cc1a6c0440c9563c</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>EventFilter *</type>
      <name>getEventFilter</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a8455dba77b1205c04437b353004301b6</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>SoDirectionalLight *</type>
      <name>getHeadlight</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a41633450a615809089cadbb61c349a8a</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual SoNode *</type>
      <name>getSceneGraph</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a8875163d1b59e63e85666dcc1bdf49e5</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>SoEventManager *</type>
      <name>getSoEventManager</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>aceea5c38d70efd4f3393fa73fe319c44</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>SoRenderManager *</type>
      <name>getSoRenderManager</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>aa6e72575ebb33cc2ee0fe7769419b75b</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual QSize</type>
      <name>minimumSizeHint</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a0abd1abd2f94a3a9e5a86284fadd566d</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>processSoEvent</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a5f98991f2040cd32f1daf464e5eb1cf0</anchor>
      <arglist>(const SoEvent *event)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>removeStateMachine</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>ad5fed85a4e412100d0a25830e244a76d</anchor>
      <arglist>(SoScXMLStateMachine *statemachine)</arglist>
    </member>
    <member kind="function">
      <type>QList&lt; QAction * &gt;</type>
      <name>renderModeActions</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>ae342a5d42f0c702119dcabff93e5f382</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>resetNavigationModeFile</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a1d652992b50ff27da20ad97e329538d8</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setBackgroundColor</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a03329e432d48d84b8ab302f03a86b529</anchor>
      <arglist>(const QColor &amp;color)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setClearWindow</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>aba71abee195202c2ae4537e4f5d9f323</anchor>
      <arglist>(bool onoff)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setClearZBuffer</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a02fe56e2e0102710b9ad03e23754d6b2</anchor>
      <arglist>(bool onoff)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setContextMenuEnabled</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>aefdc98dd6f87a15b4be10dc54a4b0011</anchor>
      <arglist>(bool yes)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setHeadlightEnabled</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a2afa5ba22eb1026655db3110ddb27f6a</anchor>
      <arglist>(bool onoff)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setInteractionModeEnabled</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>ab8466bfa7e7a35258c9fe8c7afcd0163</anchor>
      <arglist>(bool onoff)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setInteractionModeOn</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a43595dc1964dd625fa322ec3f40c297a</anchor>
      <arglist>(bool onoff)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setNavigationModeFile</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a963600c84147e0383a15a5d1561f1c6f</anchor>
      <arglist>(const QUrl &amp;url=QUrl(DEFAULT_NAVIGATIONFILE))</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>setSceneGraph</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a139a778aec869feeb2e717fdf3b31398</anchor>
      <arglist>(SoNode *root)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setSoEventManager</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a145cdbd0420c500e0811f0d8b1ffd609</anchor>
      <arglist>(SoEventManager *manager)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setSoRenderManager</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>af761f2ff44ce49e3ea16917874e245ef</anchor>
      <arglist>(SoRenderManager *manager)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setStateCursor</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a9b7a4a63d2ac2cf5e9d00d186d4c9040</anchor>
      <arglist>(const SbName &amp;state, const QCursor &amp;cursor)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setupDefaultCursors</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a098ce1b4efc8a057a857e465584db956</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QCursor</type>
      <name>stateCursor</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a80890203f283335d623c727309244a0a</anchor>
      <arglist>(const SbName &amp;state)</arglist>
    </member>
    <member kind="function">
      <type>QList&lt; QAction * &gt;</type>
      <name>stereoModeActions</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>ab233005e2b8fe67da7db5302e2cf905c</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>QList&lt; QAction * &gt;</type>
      <name>transparencyTypeActions</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a02c307803b076805daf9aef99d036751</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>actualRedraw</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>aa57afa0455fa7a38fabf0084ac35faa8</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>initializeGL</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>adffae249c842ae29cf927dd5572ff5ce</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>paintGL</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>af76d5ed3f4850a443d0d4fc3f2811771</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>resizeGL</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a31f5e314d002bb9b382616cf0ccd6a98</anchor>
      <arglist>(int width, int height)</arglist>
    </member>
    <member kind="property">
      <type>QColor</type>
      <name>backgroundColor</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>af1de4ab06e9ff41a61517adc8d542fec</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>bool</type>
      <name>clearWindow</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>ae0a34da2bf1e5e44e74031925ec57711</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>bool</type>
      <name>clearZBuffer</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a52fc52452b2b27ce75eb3e08a6dae428</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>bool</type>
      <name>contextMenuEnabled</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a1cfb6ad1a650a84a1bcc74ec25da417d</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>qreal</type>
      <name>devicePixelRatio</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a5ca9ccdc8f28b7d491337f4fa03d5298</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>bool</type>
      <name>headlightEnabled</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a43b937b41fe69693ef1cbd633d6e1f7f</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>bool</type>
      <name>interactionModeEnabled</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a41474fa9524448e84ea7bce2cf4c3b2c</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>bool</type>
      <name>interactionModeOn</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>abc7b26ffdae33afaa88c95ed072773ac</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>QUrl</type>
      <name>navigationModeFile</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a7b7e5e32d98c12ecb9b26d0e33ea74ec</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>RenderMode</type>
      <name>renderMode</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>aae186c9be859354640f21238ffc0ba76</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>StereoMode</type>
      <name>stereoMode</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>abbca6299bc65bebcbe11ffd90b358198</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>TransparencyType</type>
      <name>transparencyType</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QuarterWidget.html</anchorfile>
      <anchor>a14bc819ce956f2c46d16529481f86f50</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>SIM::Coin3D::Quarter::QtDesigner::QuarterWidgetPlugin</name>
    <filename>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</filename>
    <base>QObject</base>
    <base>QDesignerCustomWidgetInterface</base>
    <member kind="function">
      <type></type>
      <name>QuarterWidgetPlugin</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>ae43991c019f561a567888cc38c66c5ec</anchor>
      <arglist>(QObject *parent=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~QuarterWidgetPlugin</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>a6813d9e7fd6ddbef987d4414166d4d3c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QWidget *</type>
      <name>createWidget</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>af4a5880f4f56676516d9a22224e7189e</anchor>
      <arglist>(QWidget *parent)</arglist>
    </member>
    <member kind="function">
      <type>QString</type>
      <name>domXml</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>ac2c0fe61455f3f7975adec0110d05be3</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>QString</type>
      <name>group</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>aa24d89c1f65be8bef2163c13049f8d28</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>QIcon</type>
      <name>icon</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>a1b8b86a469db1053b856f3410edff958</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>QString</type>
      <name>includeFile</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>a1171325590538c377f007e08531cb55e</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>initialize</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>a21bc4ede90dfa5b807e7e148f8d835bb</anchor>
      <arglist>(QDesignerFormEditorInterface *core)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isContainer</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>a342ce23fcae2a6fa5f362e0ef1484a46</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isInitialized</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>a1efe68f60fc389802a4ba89aa432dd13</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>QString</type>
      <name>name</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>a6ddf994ec8a0364a5490cf3a19f2afb0</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>QString</type>
      <name>toolTip</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>a6ad003731c66860fb28616eb9ae8103b</anchor>
      <arglist>(void) const</arglist>
    </member>
    <member kind="function">
      <type>QString</type>
      <name>whatsThis</name>
      <anchorfile>classSIM_1_1Coin3D_1_1Quarter_1_1QtDesigner_1_1QuarterWidgetPlugin.html</anchorfile>
      <anchor>a502686c80c87e43741a68a3407107e27</anchor>
      <arglist>(void) const</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>examples</name>
    <title>More Examples</title>
    <filename>examples.html</filename>
    <subpage>directui.html</subpage>
    <subpage>dynamicui.html</subpage>
    <subpage>inheritui.html</subpage>
    <subpage>mdi.html</subpage>
    <subpage>examiner.html</subpage>
  </compound>
  <compound kind="page">
    <name>QuarterWidgetPlugin</name>
    <title>Qt Designer Plugin</title>
    <filename>QuarterWidgetPlugin.html</filename>
  </compound>
  <compound kind="page">
    <name>directui</name>
    <title>A Direct Approach</title>
    <filename>directui.html</filename>
  </compound>
  <compound kind="page">
    <name>dynamicui</name>
    <title>Dynamic Loading</title>
    <filename>dynamicui.html</filename>
  </compound>
  <compound kind="page">
    <name>inheritui</name>
    <title>Single Inheritance</title>
    <filename>inheritui.html</filename>
  </compound>
  <compound kind="page">
    <name>examiner</name>
    <title>Examiner type Viewer</title>
    <filename>examiner.html</filename>
  </compound>
  <compound kind="page">
    <name>mdi</name>
    <title>Multiple Document Interface</title>
    <filename>mdi.html</filename>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>Quarter</title>
    <filename>index.html</filename>
    <subpage>QuarterWidgetPlugin.html</subpage>
    <subpage>examples.html</subpage>
  </compound>
</tagfile>
