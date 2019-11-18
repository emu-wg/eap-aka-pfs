SERVER	= arkko.eu
#SERVER	= arkko.eu

diff:
	ssh jar@$(SERVER) 'cd /tmp; rm -f draft*'
	scp draft-arkko-eap-aka-pfs-0?.txt \
	    draft-ietf-emu-aka-pfs-0?.txt \
	    jar@$(SERVER):/tmp
	scp draft-arkko-eap-aka-pfs.xml jar@$(SERVER):/tmp
	ssh jar@$(SERVER) 'cd /tmp; xml2rfc draft-arkko-eap-aka-pfs.xml'
	scp jar@$(SERVER):/tmp/draft-arkko-eap-aka-pfs.txt .
	ssh jar@$(SERVER) 'cd /tmp; rfcdiff draft-ietf-emu-aka-pfs-01.txt draft-arkko-eap-aka-pfs.txt; mv -i draft-arkko-eap-aka-pfs-from-ietf-emu-aka-pfs-01.diff.html draft-ietf-emu-aka-pfs-from--01.diff.html'
	scp jar@$(SERVER):/tmp/draft-ietf-emu-aka-pfs-from--01.diff.html .
	scp draft-arkko-eap-aka-pfs.txt \
	    draft-ietf-emu-aka-pfs-from--01.diff.html \
	    jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/eap
