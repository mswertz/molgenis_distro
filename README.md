MOLGENIS Distribution
---------------------
The empty MOLGENIS Distribution, fork this and create your own MOLGENIS Application

Developing your own
-------------------
Generate generate your own in three steps:

1) Clone the MOLGENIS generator and an empty distro

     git clone https://www.github.com/molgenis/molgenis.git
     git clone https://www.github.com/molgenis/molgenis_distro.git
     cd molgenis_distro

2) Model what you want for your experiment in a simple XML file example db, example ui

     <editor> molgenis.properties
     <editor> molgenis_db.xml
     <editor> molgenis_ui.xml

3) Run the MOLGENIS generator, after that you're able to use your web 
application.

(Eclipse) MOLGENIS Distro
------------------------

- Edit molgenis_db.xml and molgenis_ui.xml to (re)model your application
- Run 'handwritten/java/MolgenisGenerate' to (re)generate the new software
- Run 'handwritten/java/MolgenisUpdateDatabase' to update the database with the new schema
- Run 'handwritten/java/MolgenisExtractModel' to extract a MOLGENIS model from an existing database
(- Edit molgenis.properties to change the database connection settings)

How to view the results
- Re-compile your project 
  (in Eclipse, right-mouse button on molgenis_distro and then 'refresh'
- Run on web server 
  (in Eclipse, right-click run on Server)
