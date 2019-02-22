#ifndef SETUPOPENGL_H
#define SETUPOPENGL_H

#include <QOpenGLFunctions>

class SetupOpenGL:public QOpenGLFunctions
{
public:
    SetupOpenGL();

    void setUp();

};

#endif // SETUPOPENGL_H
