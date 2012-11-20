<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:umb="urn:umbraco.library"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  exclude-result-prefixes="umb msxml"
>
  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:include href="_MultiLingualHelper.xslt" />
  <xsl:param name="currentPage"/>

  <xsl:template match="/">
    <nav>
      <ul>
        <xsl:apply-templates select="$currentPage/ancestor-or-self::Frontpage/*[./*[name() = concat('activateLanguage', $lang_postfix)] = 1]" mode="page" />
      </ul>
    </nav>
  </xsl:template>

  <xsl:template match="*" mode="page">
    <li>
      <a href="{umb:NiceUrl(@id)}">
        <xsl:value-of select="*[name() = concat('header', $lang_postfix)]" />
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>