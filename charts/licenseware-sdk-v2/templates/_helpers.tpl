{{/*
Expand the name of the chart.
*/}}
{{- define "licenseware-sdk-v2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "licenseware-sdk-v2.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- tpl .Values.fullnameOverride $ | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "licenseware-sdk-v2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "licenseware-sdk-v2.labels" -}}
helm.sh/chart: {{ include "licenseware-sdk-v2.chart" . }}
{{ include "licenseware-sdk-v2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "licenseware-sdk-v2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "licenseware-sdk-v2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- with .Values.commonLabels }}
{{ tpl (toYaml .) $ }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "licenseware-sdk-v2.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "licenseware-sdk-v2.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "licenseware-sdk-v2.webAppResourceName" -}}
{{- default (printf "%s-%s" (include "licenseware-sdk-v2.fullname" .) "web") .Values.webApp.nameOverride }}
{{- end }}

{{- define "licenseware-sdk-v2.workerAppResourceName" -}}
{{- default (printf "%s-%s" (include "licenseware-sdk-v2.fullname" .) "worker") .Values.workerApp.nameOverride }}
{{- end }}

{{- define "licenseware-sdk-v2.singleBinaryAppResourceName" -}}
{{- default (include "licenseware-sdk-v2.fullname" .) .Values.singleBinaryApp.nameOverride }}
{{- end }}

{{- define "licenseware-sdk-v2.sourceCodePvcName" -}}
{{- default (printf "%s-%s" (include "licenseware-sdk-v2.fullname" .) "source-code") .Values.persistence.sourceCode.nameOverride }}
{{- end }}
