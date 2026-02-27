cd working/00.incipient_data/
mkdir scrna
echo -e "SRR21566208\nSRR21566209\nSRR21566210\nSRR21566211\nSRR21566212\nSRR21566213\nSRR21566214\nSRR21566215" > scrna_sra_list.txt
nohup bash -c 'cat scrna_sra_list.txt | parallel -j 8 "prefetch {}"' > download.log 2>&1 &
cd ../
mkdir bulk
echo -e "SRR21943973\nSRR21943974\nSRR21943975\nSRR21943976\nSRR21943977\nSRR21943978" > bulk_sra_list.txt
nohup bash -c 'cat bulk_sra_list.txt | parallel -j 8 "prefetch {}"' > download.log 2>&1 &
cd ../
mkdir conversion_verification
cd conversion_verification
echo -e "SRR28574088\nSRR28574089\nSRR28574090\nSRR28574091\nSRR28574092\nSRR28574093\nSRR28574094\nSRR28574095\nSRR28574096\nSRR28574097\nSRR28574098\nSRR28574099\nSRR28574100\nSRR28574101\nSRR28574102\nSRR28574103\nSRR28574104\nSRR28574105\nSRR28574106\nSRR28574107\nSRR28574108" > list.txt
nohup bash -c 'cat list.txt | parallel -j 21 "prefetch {}"' > download.log 2>&1 &
wget -c -O GSE26887_RAW.tar 'https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE26887&format=file'
tar -xvf GSE26887_RAW.tar
mv -r GSM* raw_GSM/
mkdir raw_GSM
cd raw_GSM
gunzip *
