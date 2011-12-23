echo "set term pdf" >> gnpltscrpt

echo "set output \"kPr$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 1:6 title \"\"" >> gnpltscrpt

echo "set output \"kRe$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 1:7 title \"\"" >> gnpltscrpt

echo "set output \"kAc$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 1:8 title \"\"" >> gnpltscrpt

echo "set output \"kFM$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 1:9 title \"\"" >> gnpltscrpt

echo "set output \"kHL$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 1:10 title \"\"" >> gnpltscrpt


echo "set output \"PrRe$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 6:7 title \"\"" >> gnpltscrpt

echo "set output \"PrAc$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 6:8 title \"\"" >> gnpltscrpt

echo "set output \"PrFM$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 6:9 title \"\"" >> gnpltscrpt

echo "set output \"PrHL$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 6:10 title \"\"" >> gnpltscrpt


echo "set output \"ReAc$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 7:8 title \"\"" >> gnpltscrpt

echo "set output \"ReFM$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 7:9 title \"\"" >> gnpltscrpt

echo "set output \"ReHL$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 7:10 title \"\"" >> gnpltscrpt


echo "set output \"AcFM$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 8:9 title \"\"" >> gnpltscrpt

echo "set output \"AcHL$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 8:10 title \"\"" >> gnpltscrpt


echo "set output \"FMHL$1.pdf\"" >> gnpltscrpt
echo "plot \"$1\" using 9:10 title \"\"" >> gnpltscrpt


gnuplot < gnpltscrpt
