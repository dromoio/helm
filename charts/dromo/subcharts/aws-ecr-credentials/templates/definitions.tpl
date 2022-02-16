{{/* vim: set filetype=mustache: */}}
{{/*
Define resource names
*/}}
{{- define "aws-ecr-credentials.namespace" }}
{{- default (printf "%s" .Release.Namespace) -}}
{{- end }}

{{- define "aws-ecr-credentials.serviceAccount" }}
{{- default (printf "%s-account" .Release.Name) -}}
{{- end }}

{{- define "aws-ecr-credentials.job" }}
{{- default (printf "%s-job" .Release.Name) -}}
{{- end }}

{{- define "aws-ecr-credentials.cronJob" }}
{{- default (printf "%s-cron" .Release.Name) -}}
{{- end }}

{{- define "aws-ecr-credentials.secret" }}
{{- default (printf "%s-secret" "aws-ecr") -}}
{{- end }}


