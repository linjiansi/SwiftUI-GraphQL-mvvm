script='query SearchRepository {
  search(type:REPOSITORY,query:\"swift\",first:10,after:\"Y3Vyc29yOjEw\") {
    repositoryCount
    nodes {
        ... on Repository {
        id
        url
        name
        nameWithOwner
        description
        owner {
          avatarUrl
        }
        primaryLanguage {
          name
        }
      }
    }
    pageInfo {
      startCursor
      endCursor
      hasPreviousPage
      hasNextPage
    }
  }
}'

script="$(echo $script)"

curl -H "Authorization: bearer GITHUB_TOKEN" \
    -H "Content-Type: application/json" \
    -X POST -d "{ \"query\": \"$script\"}" https://api.github.com/graphql \
    | jq .
