FROM swift:5.3.1-focal
WORKDIR /build
ADD ./Package.* ./
RUN mkdir -p Sources/App && touch Sources/App/empty.swift \
    && mkdir -p Sources/Run && touch Sources/Run/main.swift
RUN swift package resolve
RUN swift build -c release
ADD ./Sources ./Sources
RUN swift build -c release
ENV PORT 80
EXPOSE $PORT
CMD /app/Run serve --env production --hostname 0.0.0.0 -p $PORT
