BeforeAll {
    Import-Module -Name $PSSCRIPTROOT/PSUmbrellaAPI.psd1 -Force
}

Describe Connect-UmbrellaAPI {

}

AfterAll {
    Remove-Module -Name PSUmbrellaAPI -Force
}