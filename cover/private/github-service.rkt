#lang racket/base
(provide github-service@ github-ci?)

(require "ci-service.rkt" racket/unit racket/list racket/string)

(define (github-ci?) (and (getenv "CI") (getenv "GITHUB_ACTION")))

(define-unit github-service@
  (import)
  (export ci-service^)

  (define (query)
    (define project-url
      (format "~a/~a" (getenv "GITHUB_SERVER_URL") (getenv "$GITHUB_REPOSITORY")))
    (define branch (getenv "GITHUB_REF"))
    (list (cons 'service "custom")
          (cons 'token (getenv "CODECOV_TOKEN"))
          ;; (cons 'branch branch)
          ;; (cons 'job (getenv "GITHUB_RUN_ID"))
          ;; (cons 'slug (getenv "GITHUB_REPOSITORY"))
          ;; (cons 'build (getenv "GITHUB_JOB"))
          ;; (cons 'build_url (and project-url branch (format "~a/tree/~a" project-url branch)))
          (cons 'commit (getenv "GITHUB_SHA")))))
