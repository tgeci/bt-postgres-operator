###############################################
# Named template dynamicClusterConfig.patroni #
###############################################
{{- define "dynamicClusterConfig.patroni" }}
{{ if eq .Values.clusterSize "small" }}
patroni:
  dynamicConfiguration:
    postgresql:
      parameters:
        max_connections: 2048
        shared_buffers: 1GB
        temp_buffers: 16MB
        effectice_cache_size: 3GB
        work_mem: 8MB
        maintenance_work_mem: 128MB
{{ else if eq .Values.clusterSize "medium" }}
patroni:
  dynamicConfiguration:
    postgresql:
      parameters:
        max_connections: 2048
        shared_buffers: 1GB
        temp_buffers: 16MB
        effectice_cache_size: 3GB
        work_mem: 8MB
        maintenance_work_mem: 128MB
{{ else if eq .Values.clusterSize "large" }}
patroni:
  dynamicConfiguration:
    postgresql:
      parameters:
        max_connections: 2048
        shared_buffers: 1GB
        temp_buffers: 16MB
        effectice_cache_size: 3GB
        work_mem: 8MB
        maintenance_work_mem: 128MB
{{ end }}
{{- end -}}

####################################################
# Named template dynamicClusterConfig.proxy.config #
####################################################
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
        max_client_conn: "1024"
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
        max_client_conn: "1024"
        default_pool_size: "50"
{{ end }}
{{- end -}}