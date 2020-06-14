def main(ctx):
  return [
    testing(ctx),
  ]

def testing(ctx):
  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'testing',
    'platform': {
      'os': 'linux',
      'arch': 'amd64',
    },
    'steps': [
      {
        'name': 'fmt',
        'image': 'webhippie/vlang:latest',
        'pull': 'always',
        'commands': [
          'make fmt',
        ],
      },
      {
        'name': 'build',
        'image': 'webhippie/vlang:latest',
        'pull': 'always',
        'commands': [
          'make build',
        ],
      },
      {
        'name': 'test',
        'image': 'webhippie/vlang:latest',
        'pull': 'always',
        'commands': [
          'make test',
        ],
      },
    ],
    'trigger': {
      'ref': [
        'refs/heads/master',
        'refs/tags/**',
        'refs/pull/**',
      ],
    },
  }
