###################################################
### Named template dynamicClusterConfig.patroni ###
###################################################
{{- define "dynamicClusterConfig.patroni" }}
{{ if eq .Values.clusterSize "small" }}
patroni:
  dynamicConfiguration:
    postgresql:
      parameters:
        max_connections: 1024
        shared_buffers: 512MB
        temp_buffers: 8MB
        effectice_cache_size: 1536MB
        work_mem: 4MB
        maintenance_work_mem: 64MB
{{ else if eq .Values.clusterSize "medium" }}
patroni:
  dynamicConfiguration:
    postgresql:
      parameters:
        max_connections: 2000
        shared_buffers: 2GB
        temp_buffers: 16MB
        effectice_cache_size: 6GB
        work_mem: 16MB
        maintenance_work_mem: 256MB
{{ else if eq .Values.clusterSize "large" }}
patroni:
  dynamicConfiguration:
    postgresql:
      parameters:
        max_connections: 8000
        shared_buffers: 8GB
        temp_buffers: 64MB
        effectice_cache_size: 24GB
        work_mem: 64MB
        maintenance_work_mem: 1024MB
{{ end }}
{{- end -}}

########################################################
### Named template dynamicClusterConfig.proxy.config ###
########################################################
{{- define "dynamicClusterConfig.proxy.config" }}
{{ if eq .Values.clusterSize "small" }}
proxy:
  pgBouncer:
    {{- if .Values.imagePgBouncer }}
    image: {{ .Values.imagePgBouncer | quote }}
    {{- end }}
    {{- if .Values.pgBouncerReplicas }}
    replicas: {{ .Values.pgBouncerReplicas  }}
    {{- end }}
    config:
      global:
        max_client_conn: "1024"
        default_pool_size: "50"
{{ else if eq .Values.clusterSize "medium" }}
proxy:
  pgBouncer:
    {{- if .Values.imagePgBouncer }}
    image: {{ .Values.imagePgBouncer | quote }}
    {{- end }}
    {{- if .Values.pgBouncerReplicas }}
    replicas: {{ .Values.pgBouncerReplicas  }}
    {{- end }}
    config:
      global:
        max_client_conn: "2000"
        default_pool_size: "75"
{{ else if eq .Values.clusterSize "large" }}
proxy:
  pgBouncer:
    {{- if .Values.imagePgBouncer }}
    image: {{ .Values.imagePgBouncer | quote }}
    {{- end }}
    {{- if .Values.pgBouncerReplicas }}
    replicas: {{ .Values.pgBouncerReplicas  }}
    {{- end }}
    config:
      global:
        max_client_conn: "8000"
        default_pool_size: "100"
{{ end }}
{{- end -}}