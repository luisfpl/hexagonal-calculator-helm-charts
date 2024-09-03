{{/*
Expand the name of the chart or use a default name if Release.Name is not available
*/}}
{{- define "hexagonal-calculator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a fullname using the release name and the chart name, or just the chart name if Release.Name is nil
*/}}
{{- define "hexagonal-calculator.fullname" -}}
{{- if and .Release.Name (ne .Release.Name "") }}
{{- printf "%s-%s" .Release.Name (include "hexagonal-calculator.name" .) | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- include "hexagonal-calculator.name" . -}}
{{- end }}
{{- end }}

{{/*
Return the chart name and version
*/}}
{{- define "hexagonal-calculator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end }}

{{/*
Common labels for all resources
*/}}
{{- define "hexagonal-calculator.labels" -}}
labels:
  app.kubernetes.io/name: {{ include "hexagonal-calculator.name" . }}
  helm.sh/chart: {{ include "hexagonal-calculator.chart" . }}
  app.kubernetes.io/instance: {{ .Release.Name | default (include "hexagonal-calculator.name" .) }}
  app.kubernetes.io/version: {{ .Chart.AppVersion }}
  app.kubernetes.io/managed-by: {{ .Release.Service | default "helm" }}
{{- end }}
