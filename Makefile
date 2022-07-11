
PORTS = -p 8820
SCPPORTS = -P 8820
SERVER = cloud2.arkko.eu
USERNAMESERVER = jar

#PORTS =
#SCPPORTS = 
#SERVER	= arkko.eu
#USERNAMESERVER = jar

WEB = cloud3.arkko.eu
USERNAMEWEB = root

jaricompile:	diff

diff:
	ssh $(PORTS) $(USERNAMESERVER)@$(SERVER) 'cd /tmp; rm -f draft*'
	scp $(SCPPORTS) draft-arkko-eap-aka-pfs-0?.txt \
	    draft-ietf-emu-aka-pfs-0?.txt \
	    $(USERNAMESERVER)@$(SERVER):/tmp
	scp $(SCPPORTS) draft-arkko-eap-aka-pfs.xml $(USERNAMESERVER)@$(SERVER):/tmp
	ssh $(PORTS) $(USERNAMESERVER)@$(SERVER) 'cd /tmp; xml2rfc draft-arkko-eap-aka-pfs.xml'
	scp $(SCPPORTS) $(USERNAMESERVER)@$(SERVER):/tmp/draft-arkko-eap-aka-pfs.txt .
	ssh $(PORTS) $(USERNAMESERVER)@$(SERVER) 'cd /tmp; rfcdiff draft-ietf-emu-aka-pfs-06.txt draft-arkko-eap-aka-pfs.txt; mv -i draft-arkko-eap-aka-pfs-from-ietf-emu-aka-pfs-06.diff.html draft-ietf-emu-aka-pfs-from--06.diff.html'
	scp $(SCPPORTS) $(USERNAMESERVER)@$(SERVER):/tmp/draft-ietf-emu-aka-pfs-from--06.diff.html .
	scp draft-arkko-eap-aka-pfs.txt \
	    draft-ietf-emu-aka-pfs-from--06.diff.html \
	    $(USERNAMEWEB)@$(WEB):/var/www/www.arkko.com/html/ietf/eap
