<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Hotel Directory</title>
        <style>
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid black; padding: 8px; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2>Hotel Directory</h2>
        <table>
          <tr>
            <th>Name</th>
            <th>Phones</th>
            <th>Address</th>
            <th>Nearest Airport</th>
            <th>Rating</th>
          </tr>
          <xsl:for-each select="Hotels/Hotel">
            <tr>
              <td><xsl:value-of select="Name"/></td>
              <td>
                <xsl:for-each select="Phone">
                  <xsl:value-of select="."/>
                  <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
              </td>
              <td>
                <xsl:value-of select="Address/Number"/>&#160;
                <xsl:value-of select="Address/Street"/>,&#160;
                <xsl:value-of select="Address/City"/>,&#160;
                <xsl:value-of select="Address/State"/>&#160;
                <xsl:value-of select="Address/Zip"/>
              </td>
              <td><xsl:value-of select="Address/@NearestAirport"/></td>
              <td><xsl:value-of select="@Rating"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
