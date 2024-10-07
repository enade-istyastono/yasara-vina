CD (MacroDir)
for i=001 to 100
  Shell mkdir redock-(i)
  CopyFile vina.config,redock-(i)/vina.config
  CopyFile protein.pdbqt,redock-(i)/protein.pdbqt
  CopyFile ligand.pdbqt,redock-(i)/ligand.pdbqt  
  CD redock-(i)
  Shell (YASARADir)\vina\vina_1.2.5_win.exe --config vina.config > out.log
  Shell (YASARADir)\vina\vina_split_1.2.5_win.exe --input ligand_out.pdbqt
  LoadPDBQT ligand.pdbqt,Resonate=No
  LoadPDBQT ligand_out_ligand_1.pdbqt,Resonate=No
  TransferObj 2,1,Local=Match
  DelAtom Element H
  LogAs rmsd.log
  RMSDObj 2,1,Match=AtomName+AltLoc,Flip=Yes,Unit=Obj
  Shell findstr ligand rmsd.log >> ../rmsd_bestpose_all.txt
  DelFile ligand.pdqbt
  DelFile protein.pdbqt
  DelFile vina.config
  Clear
  CD ..
Exit