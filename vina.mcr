Console On
CD (MacroDir)
Shell (YASARADir)\vina\vina_1.2.5_win.exe --config vina.config > out.log
Shell (YASARADir)\vina\vina_split_1.2.5_win.exe --input ligand_out.pdbqt
LoadPDBQT ligand.pdbqt,Resonate=No
LoadPDBQT ligand_out_ligand_1.pdbqt,Resonate=No
TransferObj 2,1,Local=Match
DelAtom Element H
LogAs rmsd.log
RMSDObj 2,1,Match=AtomName+AltLoc,Flip=Yes,Unit=Obj
BallStickObj 1-2
Print "Sudah selesai."