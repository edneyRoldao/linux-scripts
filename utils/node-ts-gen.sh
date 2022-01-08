#!/bin/bash
echo "###############################################"
echo "##### NODE PROJECT GENERATOR - TYPESCRIPT #####"
echo "###############################################"
echo " The first parameter should be the name of project"

echo "-----------------------------------------------------"
echo "######## LOG - creating project folder from current folder"
mkdir $1
cd $1

echo "-----------------------------------------------------"
echo "######## LOG - creating project"
yarn init -y

echo "-----------------------------------------------------"
echo "######## LOG - installing typescript as dev dependency"
yarn add typescript -D

echo "-----------------------------------------------------"
echo "######## LOG - creating tsconfig file"
echo "{" >> tsconfig.json
echo "  \"compilerOptions\": {" >> tsconfig.json
echo "    \"rootDir\": \"./src\"," >> tsconfig.json
echo "    \"outDir\": \"./dist\"," >> tsconfig.json
echo "    \"target\": \"es2019\"," >> tsconfig.json
echo "    \"module\": \"commonjs\"," >> tsconfig.json
echo "    \"lib\": [\"es6\"]," >> tsconfig.json
echo "    \"typeRoots\": [" >> tsconfig.json
echo "      \"./node_modules/@types\"," >> tsconfig.json
echo "      \"./src/@types\"" >> tsconfig.json
echo "    ]," >> tsconfig.json
echo "    \"strict\": true," >> tsconfig.json
echo "    \"allowJs\": true," >> tsconfig.json
echo "    \"skipLibCheck\": true," >> tsconfig.json
echo "    \"noImplicitAny\": true," >> tsconfig.json
echo "    \"removeComments\": true," >> tsconfig.json
echo "    \"esModuleInterop\": true," >> tsconfig.json
echo "    \"resolveJsonModule\": true," >> tsconfig.json
echo "    \"emitDecoratorMetadata\": true," >> tsconfig.json
echo "    \"experimentalDecorators\": true," >> tsconfig.json
echo "    \"forceConsistentCasingInFileNames\": true," >> tsconfig.json
echo "    \"baseUrl\": \".\"," >> tsconfig.json
echo "    \"paths\": {" >> tsconfig.json
echo "      \"@controllers/*\": [\"./src/controllers/*\"]," >> tsconfig.json
echo "      \"@models/*\": [\"./src/models/*\"]," >> tsconfig.json
echo "      \"@config/*\": [\"./src/config/*\"]," >> tsconfig.json
echo "      \"@views/*\": [\"./src/views/*\"]" >> tsconfig.json
echo "    }" >> tsconfig.json
echo "  }," >> tsconfig.json
echo "  \"include\": [" >> tsconfig.json
echo "    \"src/**/*\"" >> tsconfig.json
echo "  ]" >> tsconfig.json
echo "}" >> tsconfig.json

echo "-----------------------------------------------------"
echo "######## LOG - installing typescript as dev dependency"
yarn add ts-node-dev -D
yarn add tsconfig-paths -D
yarn add @types/node -D

echo "-----------------------------------------------------"
echo "######## LOG - installing express"
yarn add express
yarn add @types/express -D

echo "-----------------------------------------------------"
echo "######## LOG - creating source folders"
mkdir src
mkdir src/tests
mkdir src/views
mkdir src/config
mkdir src/models
mkdir src/controllers

echo "-----------------------------------------------------"
echo "######## LOG - creating server.ts"
echo "import express from 'express';" >> src/server.ts
echo "" >> src/server.ts
echo "const app = express();" >> src/server.ts
echo "" >> src/server.ts
echo "app.get('/', (req, res) => {" >> src/server.ts
echo "   return res.json({message: 'Hello World'});" >> src/server.ts
echo "})" >> src/server.ts
echo "" >> src/server.ts
echo "app.listen(3000);" >> src/server.ts
echo "" >> src/server.ts

echo "-----------------------------------------------------"
echo "######## LOG - Config Jest"
yarn add jest -D
yarn add ts-jest -D
yarn add @types/jest -D

echo "import { compilerOptions } from './tsconfig.json';" >> jest.config.ts
echo "import { pathsToModuleNameMapper } from 'ts-jest/utils';" >> jest.config.ts
echo "" >> jest.config.ts
echo "export default {" >> jest.config.ts
echo "  clearMocks: true," >> jest.config.ts
echo "  resetMocks: true," >> jest.config.ts
echo "  preset: 'ts-jest'," >> jest.config.ts
echo "  coverageDirectory: './coverage'," >> jest.config.ts
echo "  testMatch: [" >> jest.config.ts
echo "    '**/__tests__/**/*.[jt]s?(x)'," >> jest.config.ts
echo "    '**/?(*.)+(spec|test).[tj]s?(x)'" >> jest.config.ts
echo "  ]," >> jest.config.ts
echo "  moduleNameMapper: pathsToModuleNameMapper(compilerOptions.paths, { prefix: '<rootDir>' })" >> jest.config.ts
echo "}" >> jest.config.ts

echo "-----------------------------------------------------"
echo "######## LOG - Config eslint"
yarn add eslint -D
yarn add @typescript-eslint/parser -D
yarn add @typescript-eslint/eslint-plugin -D

echo "{" >> .eslintrc.json
echo "  \"env\": {" >> .eslintrc.json
echo "     \"es2021\": true," >> .eslintrc.json
echo "     \"node\": true," >> .eslintrc.json
echo "     \"jest\": true" >> .eslintrc.json
echo "   }," >> .eslintrc.json
echo "  \"parser\": \"@typescript-eslint/parser\"," >> .eslintrc.json
echo "  \"parserOptions\": {" >> .eslintrc.json
echo "     \"ecmaVersion\": 13," >> .eslintrc.json
echo "     \"sourceType\": \"module\"" >> .eslintrc.json
echo "   }," >> .eslintrc.json
echo "  \"plugins\": [" >> .eslintrc.json
echo "    \"@typescript-eslint\"" >> .eslintrc.json
echo "   ]," >> .eslintrc.json
echo "  \"extends\": [" >> .eslintrc.json
echo "    \"eslint:recommended\"," >> .eslintrc.json
echo "    \"plugin:@typescript-eslint/eslint-recommended\"," >> .eslintrc.json
echo "    \"plugin:@typescript-eslint/recommended\"" >> .eslintrc.json
echo "   ]," >> .eslintrc.json
echo "  \"rules\": {" >> .eslintrc.json
echo "   }" >> .eslintrc.json
echo "}" >> .eslintrc.json

echo "-----------------------------------------------------"
echo "######## LOG - adding run script"
sed -i '6i\  "scripts": {' package.json
sed -i '7i\     "dev": "ts-node-dev -r tsconfig-paths/register --respawn --ignore-watch node_modules --no-notify src/server.ts",' package.json
sed -i '8i\     "test": "test",' package.json
sed -i '9i\     "lint": "eslint ./src ./test --ext .ts",' package.json
sed -i '10i\     "lint:fix": "eslint ./src ./test --ext .ts --fix"' package.json
sed -i '11i\  },' package.json
