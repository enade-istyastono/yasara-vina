# Silakan definisikan folder tempat instalasi ADFRsuite
ADFRDir='(YASARADir)\ADFRsuite'
# Biasanya baris-baris di bawah ini tidak perlu diubah
CD (MacroDir)
Style BallStick
LoadPDB test.pdb,Center=No,Correct=No,Transfer=No
pH value=7.4,update=Yes
CleanAll
SavePDB 1,ligand.pdb,Format=PDB,Transform=No,UseCIF=No
Clear
Shell (ADFRDir)\python.exe (ADFRDir)\Lib\site-packages\AutoDockTools\Utilities24\prepare_ligand4.py -l .\ligand.pdb
DelFile ligand.pdb
LoadPDBQT ligand.pdbqt,Resonate=No
