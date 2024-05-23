###################################################
### Named template dynamicClusterConfig.patroni ###
###################################################
{{- define "dynamicClusterConfig.patroni" }}
{{ if eq .Values.clusterSize "small" }}
patroni:
  dynamicConfiguration:
    postgresql:
      parameters:
        max_connections: 128
        shared_buffers: 256MB
        temp_buffers: 8MB
        effectice_cache_size: 1GB
        work_mem: 8MB
        maintenance_work_mem: 16MB
{{ else if eq .Values.clusterSize "medium" }}
patroni:
  dynamicConfiguration:
    postgresql:
      parameters:
        max_connections: 256
        shared_buffers: 512MB
        temp_buffers: 10MB
        effectice_cache_size: 2GB
        work_mem: 8MB
        maintenance_work_mem: 64MB
{{ else if eq .Values.clusterSize "large" }}
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
        max_client_conn: "250"
        default_pool_size: "20"
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
        max_client_conn: "500"
        default_pool_size: "50"
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
        max_client_conn: "2000"
        default_pool_size: "100"
{{ end }}
{{- end -}}