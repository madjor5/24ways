<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:umb="urn:umbraco.library"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  exclude-result-prefixes="umb msxml"
>
  <!-- Some XML defining the languages and some settings used in my latest project, primarily used to generate language chooser dropdown. -->
  <xsl:variable name="domainXML">
    <domains default-domain="en">
      <domain id="en" lang_append="_en" class="lang-en" domain-prefix="" dictionary-name="english" />
      <domain id="da" lang_append="_da" class="lang-da" domain-prefix="da." dictionary-name="danish" />
    </domains>
  </xsl:variable>
  <!-- Variable containg above as a nodeset -->
  <xsl:variable name="domains" select="msxml:node-set($domainXML)" /> 

  <!-- Detecting servername, domain name and baseURL -->
  <xsl:variable name="serverName" select="umb:RequestServerVariables('SERVER_NAME')"/>
  <xsl:variable name="domainName">
    <xsl:choose>
      <xsl:when test="contains($serverName, 'www.')"><xsl:value-of select="substring-after($serverName, 'www.')"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$serverName"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="baseURL" select="substring-after($serverName, substring-before($serverName, '[domain-name]'))" />

  <!-- Look into dictionary to detect language -->
  <xsl:variable name="lang" select="umb:GetDictionaryItem('currentCulture')" />
  <xsl:variable name="lang_postfix" select="concat('_', $lang)" />

  <!-- tell system what is the default language -->
  <xsl:variable name="fallback_lang" select="'en'" />
  <xsl:variable name="fallback_lang_append" select="'_en'" />

</xsl:stylesheet>