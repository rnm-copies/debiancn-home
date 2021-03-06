<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes=""
>
  <xsl:output method="html" indent="yes" encoding="UTF-8" />

  <xsl:param name="domain-name" select="'debiancn.org'" />
  <xsl:param name="static-root" select="concat('static.', $domain-name)" />

  <xsl:template match="*">
    <xsl:element name="{name()}">
      <xsl:apply-templates select="@*|node()" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*|text()|comment()">
    <xsl:copy />
  </xsl:template>

  <xsl:template match="@href|@src">
    <xsl:choose>
      <xsl:when test="starts-with(., './')">
        <xsl:attribute name="{name()}">
          <xsl:value-of select="concat($static-root, substring(., 2))" />
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/webpage/navbar/*/@align" />

  <xsl:template match="/webpage">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
&lt;html lang="zh-CN"&gt;
</xsl:text>
    <head>
      <meta charset="UTF-8" />
      <title>
        <xsl:value-of select="title" />
      </title>
      <link rel="shortcut icon" href="{$static-root}/images/favicon.ico" />
      <meta http-equiv="X-UA-Compatible" content="chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

      <link
        href="https://cdn.bootcdn.net/ajax/libs/normalize/8.0.1/normalize.min.css"
        rel="stylesheet" crossorigin="anonymous" />
      <link href="{$static-root}/css/base.css" rel="stylesheet" />
      <xsl:apply-templates select="link" />
    </head>

    <body>
      <header class="header">
        <div class="header-icon hidden-md-up">
          <img class="debian-logo-small" src="{$static-root}/images/debian-logo.svg" alt="Debian中文社区" />
        </div>

        <div class="header-title"><a href="/"><xsl:value-of select="title" /></a></div>

        <div class="header-button hidden-sm-up">
          <div class="menu-icon" />
        </div>

        <xsl:apply-templates select="header/*" />
      </header>

      <nav class="navbar">
        <div class="navbar-header hidden-sm-down">
          <img class="debian-logo" src="{$static-root}/images/debian-logo.svg" alt="Debian中文社区" />
        </div>

        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-tabs">
            <xsl:apply-templates select="navbar/*[not(@align='right')]" />
          </ul>
          <ul class="nav navbar-nav navbar-right navbar-tabs">
            <xsl:apply-templates select="navbar/*[@align='right']" />
          </ul>
        </div>
      </nav>

      <main>
        <xsl:apply-templates select="body/*" />
      </main>

      <footer>
        <p>© 2016-2021 - <a href="//www.debiancn.org">Debian 中文社区</a></p>
        <p>Debian 是 Software in the Public Interest, Inc. 的注册商标。本站与 Debian 组织没有任何关系。</p>
        <p>本网站源代码可以在 <a href="https://github.com/debiancn/debiancn-home">GitHub</a> 找到。</p>
        <p><a href="//www.debiancn.org/privacy-terms.html">服务条款和隐私政策</a></p>
      </footer>

      <xsl:if test="script[@common='jquery']">
        <script
          src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"
          crossorigin="anonymous" />
      </xsl:if>
      <script src="{$static-root}/js/navbar.js" />
      <xsl:if test="script[@common='tab']">
        <script src="{$static-root}/js/tab.js" />
      </xsl:if>
      <xsl:apply-templates select="script[not(@common)]" />
    </body>
  </xsl:template>
</xsl:stylesheet>
