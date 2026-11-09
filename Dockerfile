# 베이스 이미지: 공식 nginx (경량 alpine 버전)
FROM nginx:alpine

# 이미지 정보(메타데이터)
LABEL org.opencontainers.image.title="chalee-dev-workstation-web" \
      org.opencontainers.image.authors="chalee-victory"

# 실행 모드를 나타내는 환경 변수
ENV APP_ENV=dev

# 내 웹 페이지로 nginx 기본 페이지를 교체
COPY app/ /usr/share/nginx/html/

# 컨테이너가 사용하는 포트 문서화
EXPOSE 80

# 30초마다 웹 서버가 응답하는지 스스로 점검
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://localhost/ || exit 1
