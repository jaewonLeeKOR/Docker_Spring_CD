# Dockerfile

## How to Write Dockerfile

### 공식 Docker Docs
https://docs.docker.com/engine/reference/builder/

### Instructions
FROM
- 불러올 베이스 이미지 지정

WORKDIR
- 베이스 이미지 내의 작업할 Directory 지정

COPY
- 도커 이미지 외부의 경로에서 도커 이미지 내부로의 파일 또는 디렉터리 copy

EXPOSE
- 이미지가 외부로 열어둘 port 명시

RUN
- 쉘 커맨드 수행
- Dockerfile로 부터 도커 이미지를 빌드 하는 순간에 수행

CMD
- 쉘 커멘드 수행
- 이미지로부터 컨테이너를 생성하여 최초로 실행할 때 수행
- 도커 실행시 함께 입력하는 파라미터에 따라 실행 유무가 변경

ENTRYPOINT
- 쉘 커멘드 수행
- 이미지로부터 컨테이너를 생성하여 최초로 실행할 때 수행
- CMD와 다르게 Dockerfile의 실행 성공 유무와 관계없이 항상 수행

VOLUME
- 볼륨 마운트
