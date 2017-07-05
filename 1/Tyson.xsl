<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" />

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="style.css"/>
      </head>
      <body>
        <h1>Mike Tyson - BESTIA</h1>
        <xsl:apply-templates select="Mike_Tyson/zdjecie" />
        <br/>  
        <xsl:call-template name="link" />
        <br/>
        <b>Data debiutu: </b>
        <xsl:value-of select="Mike_Tyson/@data_debiutu"/>
        <br/>
        <xsl:apply-templates select="Mike_Tyson/podstawowe_informacje" />
        <br/>
        <xsl:apply-templates select="Mike_Tyson/warunki_fizyczne"/>
        <br/>
        <xsl:apply-templates select="Mike_Tyson/bilans"/>
        <br/>
        <br/>
        <xsl:apply-templates select="Mike_Tyson/osiagniecia"/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <h2 style="text-decoration:underline;">WAŻNE WALKI</h2>
        <xsl:apply-templates select="Mike_Tyson/walki"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="link">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="Mike_Tyson/@wikipedia"/>
      </xsl:attribute>
      <xsl:value-of select="Mike_Tyson/@wikipedia"/>
    </xsl:element>
  </xsl:template>
   
  <xsl:template match="podstawowe_informacje">
    <b>Pseudonim: </b>
    <xsl:value-of select="pseudonim"/>
    <br/>
    <b>Kategoria wagowa: </b>
    <xsl:value-of select="kategoria_wagowa"/>
    <br/>
    <b>Data urodzenia: </b>
    <xsl:value-of select="data_urodzenia"/>
    <br/>
    <b> Miejsce urodzenia: </b>
    <xsl:value-of select="miejsce_urodzenia"/>
    <br/>

  </xsl:template>

  <xsl:template match="zdjecie">
    <xsl:element name="img" >
      <xsl:attribute name="src">
        <xsl:value-of select="href"/>
      </xsl:attribute>
      <xsl:attribute name="height">200</xsl:attribute>
    </xsl:element>
  </xsl:template>

  <xsl:template match="warunki_fizyczne">
    <table class="table_l">
      <tr>
        <td>Wzrost</td>
        <td>Zasięg ramion</td>
        <td>Waga</td>
      </tr>
      <tr>
        <td>
          <xsl:value-of select="wzrost"/>
        </td>
        <td>
          <xsl:value-of select="zasieg_ramion"/>
        </td>
        <td>
          <xsl:value-of select="waga"/>
        </td>
      </tr>

    </table>
  </xsl:template>

  <xsl:template match="bilans">
    <table class="table_3">
      <tr>
        <td>Liczba walk</td>
        <td>Wygrane</td>
        <td>Przegrane</td>
        <td>Remisy</td>
      </tr>
      <tr>
        <td>
          <xsl:value-of select="liczba_walk"/>
        </td>
        <td>
          <xsl:value-of select="wygrane"/>
        </td>
        <td>
          <xsl:value-of select="przegrane"/>
        </td>
        <td>
          <xsl:value-of select="remisy"/>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="osiagniecia">
    <br/>
    <br/>
    <br/>
    <br/>
    <h2 style="text-decoration:underline;">Osiągnięcia Mike Tysona</h2>
    <br/>
    <table class="table_r">
      <tr>
        <td>Lp.</td>
        <td> </td>
        <td>
          <center>TYTUŁY </center>
        </td>
      </tr>
      <xsl:apply-templates select="tytuly"/>
      <tr>
        <td>Lp.</td>
        <td> </td>
        <td>
          <center>NAGRODY </center>
        </td>
      </tr>
      <xsl:apply-templates select="nagrody"/>
    </table>
  </xsl:template>

  <xsl:template match="tytuly">
    <xsl:for-each select="tytuul">
      <xsl:sort select="rok"/>
      <tr>
        <td>
          <xsl:number value="position()" format="I"/>
        </td>
        <td>
          <xsl:value-of select="rok"/>
        </td>
        <td>
          <xsl:value-of select="tytul"/>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="nagrody">
    <xsl:for-each select="naagrody">
      <tr>
        <td>
          <xsl:number format="1."/>
        </td>
        <td>
          <xsl:value-of select="rok"/>
        </td>
        <td>
          <xsl:value-of select="tytul"/>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="walki">
    <xsl:for-each select="walka">
      <xsl:choose>
        <xsl:when test="@wynik='przegrana Tysona'">
          <h1 style="color:red">Mike Tyson</h1>
          <h1>vs</h1>
          <h1 style="color:green">
            <xsl:value-of select="przeciwnik/@imieinazwisko"/>
          </h1>
        </xsl:when>
        <xsl:when test="@wynik='remis'">
          <h1 style="color:white">
            Mike Tyson<br/>vs
            <xsl:value-of select="przeciwnik/@imieinazwisko"/>
          </h1>
        </xsl:when>
        <xsl:otherwise>
          <h1 style="color:green">
            Mike Tyson
          </h1>
          <h1>vs</h1>
          <h1 style="color:red">
            <xsl:value-of select="przeciwnik/@imieinazwisko"/>
          </h1>
        </xsl:otherwise>
      </xsl:choose>
      <table class="table_l">
        <tr>
          <td>Data</td>
          <td>Miejsce_walki</td>
        </tr>
        <tr>
          <td>
            <xsl:value-of select="data"/>
          </td>
          <td>
            <xsl:value-of select="miejsce_walki/państwo"/>,
            <xsl:value-of select="miejsce_walki/miasto"/>
          </td>
        </tr>
      </table>
      <br/>
      <br/>
      <br/>
      <br/>
      <h1 style="font-size:15;">PRZECIWNIK</h1>

      <xsl:apply-templates select="przeciwnik/zdjecie" />
      <xsl:element name="a">
        <xsl:attribute name="href">
          <xsl:value-of select="przeciwnik/@wikipedia"/>
        </xsl:attribute>
        <br/>
        <xsl:value-of select="przeciwnik/@wikipedia"/>
      </xsl:element>
      <br/>
      <br/>
      <br/>
      <br/>
      <table class="table_2">
        <tr>
          <td>Imię i Nazwisko</td>
          <td>Pseudonim</td>
          <td>Liczba Walk</td>
          <td>Wygrane</td>
          <td>przgrane</td>
          <td>remisy</td>
        </tr>
        <tr>
          <td>
            <xsl:value-of select="przeciwnik/@imieinazwisko"/>
          </td>
          <td>
            <xsl:value-of select="przeciwnik/pseudonim"/>
          </td>
          <td>
            <xsl:value-of select="przeciwnik/liczba_walk"/>
          </td>
          <td>
            <xsl:value-of select="przeciwnik/wygrane"/>
          </td>
          <td>
            <xsl:value-of select="przeciwnik/przegrane"/>
          </td>
          <td>
            <xsl:value-of select="przeciwnik/remisy"/>
          </td>
        </tr>
      </table>
      <br/>
      <br/>
      <br/>
      <br/>
      <xsl:apply-templates  select="przeciwnik/warunki_fizyczne"/>
      <br/>

      <br/>
      <br/>
      <h1 style="font-size:25px; color:black;">
        Ciekawostka:</h1>
        <xsl:value-of select="ciekawostki/ciekawostka"/>
        <br/>
      
      <h2> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</h2>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>

