# Silakan definisikan folder tempat instalasi ADFRsuite
ADFRDir='(YASARADir)\ADFRsuite'
# Biasanya baris-baris di bawah ini tidak perlu diubah
LoadPDB kompleks.pdb,Center=No,Correct=No,Transfer=No 
DelRes LIG
pH value=7.4,update=Yes
CleanAll
SavePDB 1,protein.pdb,Format=PDB,Transform=No,UseCIF=No
Clear
LoadPDB kompleks.pdb,Center=No,Correct=No,Transfer=No
DelRes !LIG
pH value=7.4,update=Yes
CleanAll
SavePDB 1,ligand.pdb,Format=PDB,Transform=No,UseCIF=No
Clear
Shell (ADFRDir)\python.exe (ADFRDir)\Lib\site-packages\AutoDockTools\Utilities24\prepare_receptor4.py -r .\protein.pdb
Shell (ADFRDir)\python.exe (ADFRDir)\Lib\site-packages\AutoDockTools\Utilities24\prepare_ligand4.py -l .\ligand.pdb
Shell (ADFRDir)\python.exe (ADFRDir)\prepare_gpf.py -l .\ligand.pdbqt -r .\protein.pdbqt -y
Shell findstr gridcenter protein.gpf > center-xyz.txt
LoadPDB protein.pdb,Center=No,Correct=No,Transfer=No 
LoadPDB ligand.pdb,Center=No,Correct=No,Transfer=No 
LogAs radius.txt
RadiusObj 2
LogAs defbindres.txt
ListRes Protein with distance < 4.5 from Obj 2
DelFile protein.gpf
DelFile protein.pdb
DelFile ligand.pdb
Exit