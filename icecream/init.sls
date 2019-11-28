{%- from "icecream/map.jinja" import icecream with context -%}

icecream:
  pkg.installed:
    - name: {{ icecream.pkg }}
  service.running:
    - name: {{ icecream.service }}
    - enable: True

# The following states are inert by default and can be used by other states to
# trigger a restart or reload as needed.
icecream-reload:
  module.wait:
    - name: service.reload
    - m_name: {{ icecream.service }}

icecream-restart:
  module.wait:
    - name: service.restart
    - m_name: {{ icecream.service }}
