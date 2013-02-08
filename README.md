file-viewer
===========

Jahia File viewer, a simple module to show files, and allows to select different directories from the document manager

Installation
============

Install this module like any other Jahia module by adding this module to shared_modules, or use the deployModule.sh script.


Usage
=====

1. Install the module
1. Add the File Viewer component from site Components to your page
1. Select a base folder
1. Select a type of view

Multiple Sub Directories
========================
This module was specifically design to find documentation.
For example if your directory structure looks like : product=>year=>otherSub=>all Files.
You can add 4 components to your page and let them work together. Just specify the same base folder
for each component buch change the level for each component so it knows how to react.

The view 'Show direcgories as large icons' allows you to show a folder icons, instead of the default black folder,
in the Document Managerunder the tab content it allows you to specify a specific icon to do that.


Note
====
As you noticed is that the component uses the GET parameters and not ajax, this allows to make stable URL's
for all files/directories.


TODO
====
Make browing over direcotires ajax driven while at the same time keeping stable URL's working.


Support
=======

If you want to have support for this module, please don't hessitate and contact me.


Modules Status
==============
This module is currently in beta, it is used in a project, but not yet in a production environment, changes may happen

R. van Twisk
http://riesvantwisk.com
