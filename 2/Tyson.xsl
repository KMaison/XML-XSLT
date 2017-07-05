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
        <h2 style="float: left;">
        <b>Data debiutu: </b>
        <xsl:value-of select="Mike_Tyson/@data_debiutu"/>
        <br/>
        <xsl:apply-templates select="Mike_Tyson/podstawowe_informacje" />
        <br/>
        <xsl:apply-templates select="Mike_Tyson/warunki_fizyczne"/>
        <br/>
        <xsl:apply-templates select="Mike_Tyson/bilans"/>
        </h2>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <xsl:apply-templates select="Mike_Tyson/osiagniecia"/>
        <br/><h1>FILMOGRAFIA</h1>
        <xsl:apply-templates select="Mike_Tyson/filmografia"/>
      </body>
    </html>
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
      <xsl:attribute name="height">400</xsl:attribute>
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
    <br/>
    <br/>
    <br/>
    <br/>
    <h1 style="text-align:center;">Osiągnięcia Mike Tysona</h1>
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
          <xsl:number/>
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

  <xsl:template match="filmografia">
    <h2 style="text-align:center;">Mike Tyson otrzymał
    <xsl:value-of select="@ile_nominacji"/>
    nominacji do nagrody Oscar.</h2>
    <br/>
    <table class="table_k">
      <tr>
        <td style="color:black;">Tytuł</td>
        <td style="color:black;">Rok premiery</td>
        <td style="color:black;">Ilość nominacji"</td>
        <td style="color:black;">Ilość nagród"</td>
      </tr>
        <xsl:for-each select="film">
          <tr>
            <td>
            <xsl:value-of select="@tytul_filmu"/>
          </td>
          <td>
            <xsl:value-of select="rok_premiery"/>
          </td>
          <td>
            <xsl:value-of select="ile_nominacji"/>
          </td>
          <td>
            <xsl:value-of select="ile_nagrod"/>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
</xsl:stylesheet>

