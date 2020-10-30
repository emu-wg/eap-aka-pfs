SERVER	= arkko.eu
USERNAMESERVER = jar

WEB = cloud3.arkko.eu
USERNAMEWEB = root

diff:
	ssh $(USERNAMESERVER)@$(SERVER) 'cd /tmp; rm -f draft*'
	scp draft-arkko-eap-aka-pfs-0?.txt \
	    draft-ietf-emu-aka-pfs-0?.txt \
	    $(USERNAMESERVER)@$(SERVER):/tmp
	scp draft-arkko-eap-aka-pfs.xml $(USERNAMESERVER)@$(SERVER):/tmp
	ssh $(USERNAMESERVER)@$(SERVER) 'cd /tmp; xml2rfc draft-arkko-eap-aka-pfs.xml'
	scp $(USERNAMESERVER)@$(SERVER):/tmp/draft-arkko-eap-aka-pfs.txt .
	ssh $(USERNAMESERVER)@$(SERVER) 'cd /tmp; rfcdiff draft-ietf-emu-aka-pfs-04.txt draft-arkko-eap-aka-pfs.txt; mv -i draft-arkko-eap-aka-pfs-from-ietf-emu-aka-pfs-04.diff.html draft-ietf-emu-aka-pfs-from--04.diff.html'
	scp $(USERNAMESERVER)@$(SERVER):/tmp/draft-ietf-emu-aka-pfs-from--04.diff.html .
	scp draft-arkko-eap-aka-pfs.txt \
	    draft-ietf-emu-aka-pfs-from--04.diff.html \
	    $(USERNAMEWEB)@$(WEB):/var/www/www.arkko.com/html/ietf/eap
