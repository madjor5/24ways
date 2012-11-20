<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:umb="urn:umbraco.library"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  exclude-result-prefixes="umb msxml"
>

  <xsl:variable name="domainXML">
    <domains default-domain="en">
      <domain id="en" lang_append="_en" class="lang-en" domain-prefix="" dictionary-name="english" />
      <domain id="da" lang_append="_da" class="lang-da" domain-prefix="da." dictionary-name="danish" />
    </domains>
  </xsl:variable>
  <xsl:variable name="domains" select="msxml:node-set($domainXML)" /> 
  <xsl:variable name="serverName" select="umb:RequestServerVariables('SERVER_NAME')"/>
  <xsl:variable name="domainName">
    <xsl:choose>
      <xsl:when test="contains($serverName, 'www.')"><xsl:value-of select="substring-after($serverName, 'www.')"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$serverName"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="baseURL" select="substring-after($serverName, substring-before($serverName, 'systematic'))" />
  <xsl:variable name="lang" select="umb:GetDictionaryItem('System.Lang')" />
  <xsl:variable name="lang_append" select="concat('_', $lang)" />
  <xsl:variable name="fallback_lang" select="'en'" />
  <xsl:variable name="fallback_lang_append" select="'_en'" />

</xsl:stylesheet>