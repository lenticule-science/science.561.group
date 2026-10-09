---
title: "{{ .Title }}"
type: "{{ $type }}"
description: "{{ with .Date }}{{ .Format \"2006-01-02\" }}{{ end }} {{ with .Params.authors }}by {{ range $i, $a := ."
---

{{ with .Date }}{{ .Format "2006-01-02" }}{{ end }}
{{ with .Params.authors }}by {{ range $i, $a := . }}{{ if $i }}, {{ end }}{{ $a }}{{ end }}{{ end }}
{{- $type := .Params.type | default "" }}
{{ if not (or (eq $type "text") (eq $type "paper")) }}{{ with .Description }}{{ . }}{{ end }}{{ end }}

{{- if or (eq $type "term") (eq $type "definition") (eq $type "concept") }}
{{ with .Params.defines }}

{{ end }}
{{ with $.Params.requires }}

Requires
{{ if reflect.IsSlice . }}
{{ range . }}
- {{ . }}{{ end }}
{{ else }}{{ . }}{{ end }}

{{ end }}
{{- else if or (eq $type "text") (eq $type "paper") }}
{{ with .Description }}

Abstract

{{ . }}

{{ end }}
{{- else if eq $type "lesson" }}
{{ with .Params.teaches }}

Learning objectives
{{ if reflect.IsSlice . }}
{{ range . }}
- {{ . }}{{ end }}
{{ else }}{{ . }}{{ end }}

{{ end }}
{{ with $.Params.requires }}

Prerequisites
{{ if reflect.IsSlice . }}
{{ range . }}
- {{ . }}{{ end }}
{{ else }}{{ . }}{{ end }}

{{ end }}
{{- end }}
{{- if and (gt .WordCount 500) (not .Params.notoc) -}}
{{- $headings := findRE `]*>` .Content -}}
{{- if gt (len $headings) 3 -}}

Table of contents
{{ .TableOfContents }}

{{- end -}}
{{- end }}

{{- $content := .Content -}}
{{- with .Params.references -}}
{{- if reflect.IsMap . -}}
{{- range $key, $ref := . -}}
{{- if reflect.IsMap $ref -}}
{{- $pattern := printf `\[@%s\]` $key -}}
{{- $link := printf `[[%s]](#ref-%s)` $key $key -}}
{{- $content = $content | replaceRE $pattern $link -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end }}
{{ $content | safeHTML }}

{{ with .Lastmod }}

Last reviewed {{ .Format "January 2, 2006" }}.

{{ end }}
{{ partial "bibliography.html" . }}
