diff:
	ssh jar@arkko.eu 'cd /tmp; rm -f draft*'
	scp draft-arkko-eap-aka-pfs-00.txt \
	    draft-arkko-eap-aka-pfs-01.txt \
	    draft-arkko-eap-aka-pfs-02.txt \
	    jar@arkko.eu:/tmp
	scp draft-arkko-eap-aka-pfs.xml jar@arkko.eu:/tmp
	ssh jar@arkko.eu 'cd /tmp; xml2rfc draft-arkko-eap-aka-pfs.xml'
	scp jar@arkko.eu:/tmp/draft-arkko-eap-aka-pfs.txt .
	ssh jar@arkko.eu 'cd /tmp; rfcdiff draft-arkko-eap-aka-pfs-02.txt draft-arkko-eap-aka-pfs.txt'
	scp jar@arkko.eu:/tmp/draft-arkko-eap-aka-pfs-from--02.diff.html .
	scp draft-arkko-eap-aka-pfs.txt \
	    draft-arkko-eap-aka-pfs-from--02.diff.html \
	    jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/eap
