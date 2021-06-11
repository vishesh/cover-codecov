#lang setup/infotab

(define cover-formats '(("codecov" cover/codecov generate-codecov-coverage)))
(define cover-build-services '(("gitlab-service" cover/private/gitlab-service
                                                 gitlab-ci?
                                                 gitlab-service@)
                               ("github-service" cover/private/github-service
                                                 github-ci?
                                                 github-service@)
                               ("travis-service" cover/private/travis-service
                                                 travis-ci?
                                                 travis-service@)))
