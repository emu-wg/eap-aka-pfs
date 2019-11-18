SERVER	= arkko.eu
#SERVER	= arkko.eu

diff:
	ssh jar@$(SERVER) 'cd /tmp; rm -f draft*'
	scp draft-arkko-eap-aka-pfs-00.txt \
	    draft-arkko-eap-aka-pfs-01.txt \
	    draft-arkko-eap-aka-pfs-02.txt \
	    draft-arkko-eap-aka-pfs-03.txt \
	    draft-arkko-eap-aka-pfs-04.txt \
	    jar@$(SERVER):/tmp
	scp draft-arkko-eap-aka-pfs.xml jar@$(SERVER):/tmp
	ssh jar@$(SERVER) 'cd /tmp; xml2rfc draft-arkko-eap-aka-pfs.xml'
	scp jar@$(SERVER):/tmp/draft-arkko-eap-aka-pfs.txt .
	ssh jar@$(SERVER) 'cd /tmp; rfcdiff draft-arkko-eap-aka-pfs-04.txt draft-arkko-eap-aka-pfs.txt'
	scp jar@$(SERVER):/tmp/draft-arkko-eap-aka-pfs-from--04.diff.html .
	scp draft-arkko-eap-aka-pfs.txt \
	    draft-arkko-eap-aka-pfs-from--04.diff.html \
	    jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/eap
