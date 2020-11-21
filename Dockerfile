FROM swift:5.3.1-focal as builder
WORKDIR /build
ADD ./Package.* ./
RUN swift package resolve
RUN mkdir -p Sources/App && touch Sources/App/empty.swift \
    && mkdir -p Sources/Deps && touch Sources/Deps/empty.swift \
    && mkdir -p Sources/Run && touch Sources/Run/main.swift
RUN swift build -c release --target Deps
ADD ./Sources ./Sources
ADD ./Resources ./Resources
RUN swift build -c release



FROM swift:5.3.1-focal-slim as web
RUN useradd --user-group --create-home --system --skel /dev/null --home-dir /app vapor
WORKDIR /app
COPY --from=builder --chown=vapor:vapor /build/.build/release /app
COPY --from=builder --chown=vapor:vapor /build/Resources /app/Resources
USER vapor:vapor
ENV PORT 80
EXPOSE $PORT
CMD /app/Run serve --env production --hostname 0.0.0.0 -p $PORT
