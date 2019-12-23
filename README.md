# Revealed

![GitHub](https://img.shields.io/github/license/Pointwelve/Revealed-iOS?style=for-the-badge)

![GitHub commit activity](https://img.shields.io/github/commit-activity/m/Pointwelve/Revealed-iOS?style=for-the-badge)

![GitHub release (latest by date)](https://img.shields.io/github/v/release/Pointwelve/Revealed-iOS?style=for-the-badge)

![Bitrise](https://img.shields.io/bitrise/db5e87b6bd9e91a3/master?style=for-the-badge&token=IoxmaODCR6ihAiYm_U3_tQ)


## GraphQL Update Schema
1. Install Apollo CLI `npm install -g apollo`
2. You can supply your server access token `GRAPHQL_TOKEN` and graphql end point `GRAPHQL_ENDPOINT` in environment variable.
3. Or you can supply as options in fastlane. See `download_schema` lane in Fastfile
4. run `bundle exec fastlane ios download_schema`.


## GraphQL query structure
- All .graphql files should in `Revealed/GraphQL`.
- Each graphql file should represent a single use case. E.G `GetAllPosts` or `CreatePost`
- All shared fragments can declared in `Fragments.graphql`