# Open Telekom Cloud auf Kommandozeile

Mit dem 250 EUR Gutschein der Telekom soll versucht werden eine virtuellen Server ( **Elastic Cloud Server** imTelekom Sprech ) per Kommandozeile aufzusetzen und wieder zu löschen.

Um schnell Server bzw. Infrastukturen aufzusetzen eignet sich das Tool terraform von [Hashicorp](https://www.terraform.io/docs/providers/index.html). 

### Voraussetzung

1. Wir haben den 250 EUR Gutschein eingelöst und können uns auf [MyWorkplace](https://www.websso.t-systems.com/MyWorkplace/General/TSIPageContainer.aspx#)  auf der Console  https://console.otc.t-systems.com/console/?region=eu-de#/home einloggen.

2. Wir arbeiten in einer Linux-Shell. 

3. [terraform](https://www.terraform.io/downloads.html) ist installiert.  

Die Test Umgebung ist von [https://github.com/OpenTelekomCloud/terraform-otc.git] abgekupfert.

Aktuell  Version  v0.12.13. Es wird in diesem Beispiel der provider "openstack" benutzt.
!! Bei Terraform gibt es bereits ein Provider **opentelekomcloud**. https://www.terraform.io/docs/providers/index.html. !!

Nach wechsel in den Ordner "minimal" und  anpassen der Berechtigungsdaten in `parameter.tvars`

    cd minimal

werden die Kommandos zum deployen ausgeführt.


    terraform init
    terraform plan -var-file=parameter.tvars
    terraform plan -var-file=parameter.tvars -out minimal.plan
    terraform apply minimal.plan
    terraform show

Ab hier kann mit z.B. "ansible" der Server konfiguriert werden

Nach Ende der Arbeiten werden die erzeugten Objekte wieder gelöscht.


    terraform destroy  -var-file=parameter.tvars 

