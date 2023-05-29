
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

LASTVERARKKO=06
LASTVEREMU=07

jaricompile:	diff

diff:
	ssh $(PORTS) $(USERNAMESERVER)@$(SERVER) 'cd /tmp; rm -f draft*'
	scp $(SCPPORTS) \
	    archive/draft-ietf-emu-aka-pfs-0?.txt \
	    archive/draft-ietf-emu-aka-pfs-1?.txt \
	    $(USERNAMESERVER)@$(SERVER):/tmp
	sed 's@<contact fullname="\(.*\)"/>@\1@' draft-ietf-emu-aka-pfs-latest.xml > draft-ietf-emu-aka-pfs-temp.xml
	scp $(SCPPORTS) draft-ietf-emu-aka-pfs-temp.xml $(USERNAMESERVER)@$(SERVER):/tmp/draft-ietf-emu-aka-pfs-latest.xml
	ssh $(PORTS) $(USERNAMESERVER)@$(SERVER) 'cd /tmp; xml2rfc draft-ietf-emu-aka-pfs-latest.xml'
	scp $(SCPPORTS) $(USERNAMESERVER)@$(SERVER):/tmp/draft-ietf-emu-aka-pfs-latest.txt .
	ssh $(PORTS) $(USERNAMESERVER)@$(SERVER) 'cd /tmp; rfcdiff draft-ietf-emu-aka-pfs-$(LASTVEREMU).txt draft-ietf-emu-aka-pfs-latest.txt'
	scp $(SCPPORTS) $(USERNAMESERVER)@$(SERVER):/tmp/draft-ietf-emu-aka-pfs-latest-from-$(LASTVEREMU).diff.html .
	scp draft-ietf-emu-aka-pfs-latest.txt \
	    draft-ietf-emu-aka-pfs-latest-from-$(LASTVEREMU).diff.html \
	    $(USERNAMEWEB)@$(WEB):/var/www/www.arkko.com/html/ietf/eap
