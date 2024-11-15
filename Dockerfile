FROM code.forgejo.org/forgejo/forgejo:9.0.1-rootless AS source-image

FROM scratch

ENV AWS_ACCESS_KEY_ID **None**
ENV AWS_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION **None**
ENV S3_ENDPOINT **None**
ENV S3_S3V4 no
ENV S3_PREFIX **None**
ENV S3_ENCRYPT no
ENV SCHEDULE **None**

COPY --from=source-image / /
ADD install.sh install.sh
RUN sh install.sh && rm install.sh

ADD run.sh run.sh
ADD backup.sh backup.sh

USER 1000:1000

RUN pipx install awscli
ENV PATH="$PATH:/var/lib/gitea/git/.local/bin"


VOLUME ["/data"]
CMD ["sh", "run.sh"]