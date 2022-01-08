#!/bin/bash
echo "#########################################################"
echo "################ NODE PROJECT GENERATOR #################"
echo "########### typescript, jest, estlint, babel ############"
echo "#########################################################"
echo "***** LOG node and yarn should be installed"
echo "***** LOG The first parameter should be the name of project"

if [ -z "$1" ]
then
echo "The project name was not provided as parameter"
echo "exec example: node-ts-gen.sh project-name"
echo "process terminated. exit from bash"

else
echo "-------------------------------------"
echo "***** LOG - creating folder structure"

if [ -d "$1" ]
then
    rm -r $1
fi

mkdir $1
cd $1
mkdir src
mkdir test
mkdir src/util
mkdir src/views
mkdir src/config
mkdir src/models
mkdir src/controllers


echo "-------------------------------------"
echo "***** LOG - Creating node project (package.json)"
echo "{" >> package.json
echo "  \"name\": \"$1\"," >> package.json
echo "  \"version\": \"1.0.0\"," >> package.json
echo "  \"description\": \"Node Project base with typescript, eslint and jest.\"," >> package.json
echo "  \"main\": \"src/index.js\"," >> package.json
echo "  \"author\": \"$USER\"," >> package.json
echo "  \"license\": \"ISC\"," >> package.json
echo "  \"keywords\": []," >> package.json
echo "  \"scripts\": {" >> package.json
echo "    \"build\": \"tsc\"," >> package.json
echo "    \"start\": \"yarn build && node dist/src/index.js\"," >> package.json
echo "    \"test\": \"test\"," >> package.json
echo "    \"lint\": \"eslint ./src ./test --ext .ts\"," >> package.json
echo "    \"lint:fix\": \"eslint ./src ./test --ext .ts --fix\"" >> package.json
echo "  }" >> package.json
echo "}" >> package.json


echo "-------------------------------------"
echo "***** LOG - Installing dev dependencies"
yarn add -D eslint
yarn add -D typescript
yarn add -D @types/node
yarn add -D @types/express
yarn add -D @types/module-alias
yarn add -D @typescript-eslint/parser
yarn add -D @typescript-eslint/eslint-plugin

echo "-------------------------------------"
echo "***** LOG - Installing dependencies"
yarn add express
yarn add module-alias


echo "-------------------------------------"
echo "***** LOG - Creating tsconfig.json file"
echo "{" >> tsconfig.json
echo "  \"compilerOptions\": {" >> tsconfig.json
echo "    \"target\": \"es2019\"," >> tsconfig.json
echo "    \"moduleResolution\": \"node\"," >> tsconfig.json
echo "    \"module\": \"commonjs\"," >> tsconfig.json
echo "    \"lib\": [\"es2019\"]," >> tsconfig.json
echo "    \"sourceMap\": true," >> tsconfig.json
echo "    \"outDir\": \"dist\"," >> tsconfig.json
echo "    \"strict\": true," >> tsconfig.json
echo "    \"alwaysStrict\": true," >> tsconfig.json
echo "    \"strictNullChecks\": true," >> tsconfig.json
echo "    \"strictFunctionTypes\": true," >> tsconfig.json
echo "    \"noImplicitAny\": true," >> tsconfig.json
echo "    \"noImplicitThis\": true," >> tsconfig.json
echo "    \"noImplicitReturns\": true," >> tsconfig.json
echo "    \"resolveJsonModule\": true," >> tsconfig.json
echo "    \"removeComments\": true," >> tsconfig.json
echo "    \"esModuleInterop\": true," >> tsconfig.json
echo "    \"allowSyntheticDefaultImports\": true," >> tsconfig.json
echo "    \"baseUrl\": \".\"," >> tsconfig.json
echo "    \"paths\": {" >> tsconfig.json
echo "      \"@src/*\": [\"./src/*\"]," >> tsconfig.json
echo "      \"@test/*\": [\"./test/*\"]" >> tsconfig.json
echo "    }," >> tsconfig.json
echo "    \"rootDirs\": [" >> tsconfig.json
echo "      \"./src\"," >> tsconfig.json
echo "      \"./test\"" >> tsconfig.json
echo "    ]," >> tsconfig.json
echo "    \"emitDecoratorMetadata\": true," >> tsconfig.json
echo "    \"experimentalDecorators\": true" >> tsconfig.json
echo "  }," >> tsconfig.json
echo "  \"include\": [" >> tsconfig.json
echo "    \"./src/**/*.ts\"," >> tsconfig.json
echo "    \"./test/**/*.ts\"" >> tsconfig.json
echo "  ]," >> tsconfig.json
echo "  \"exclude\": [" >> tsconfig.json
echo "    \"./node_modules/*\"," >> tsconfig.json
echo "    \"dist\"" >> tsconfig.json
echo "  ]" >> tsconfig.json
echo "}" >> tsconfig.json

echo "-------------------------------------"
echo "***** LOG - Creating .eslintrc file config"
echo "{" >> .eslintrc
echo "  \"root\": true," >> .eslintrc
echo "  \"parser\": \"@typescript-eslint/parser\"," >> .eslintrc
echo "  \"plugins\": [" >> .eslintrc
echo "    \"@typescript-eslint\"" >> .eslintrc
echo "  ]," >> .eslintrc
echo "  \"extends\": [" >> .eslintrc
echo "    \"eslint:recommended\"," >> .eslintrc
echo "    \"plugin:@typescript-eslint/eslint-recommended\"," >> .eslintrc
echo "    \"plugin:@typescript-eslint/recommended\"" >> .eslintrc
echo "  ]," >> .eslintrc
echo "  \"rules\": {" >> .eslintrc
echo "  }" >> .eslintrc
echo "}" >> .eslintrc

echo "-------------------------------------"
echo "***** LOG - Adding Module aliais config"
echo "import * as path from 'path';" >> src/config/module-alias.ts
echo "import moduleAlias from 'module-alias';" >> src/config/module-alias.ts
echo "" >> src/config/module-alias.ts
echo "const files = path.resolve(__dirname, '../..');" >> src/config/module-alias.ts
echo "" >> src/config/module-alias.ts
echo "moduleAlias.addAliases({" >> src/config/module-alias.ts
echo "  '@src': path.join(files, 'src')," >> src/config/module-alias.ts
echo "  '@test': path.join(files, 'test')" >> src/config/module-alias.ts
echo "});" >> src/config/module-alias.ts
echo "" >> src/config/module-alias.ts

echo "-----------------------------------------------------"
echo "***** LOG - creating main file index.ts"
echo "import express from 'express';" >> src/index.ts
echo "const port = process.env.port || 3000;" >> src/index.ts
echo "" >> src/index.ts
echo "const app = express();" >> src/index.ts
echo "" >> src/index.ts
echo "app.get('/', (req, res) => {" >> src/index.ts
echo "   return res.json({message: 'Hello World'});" >> src/index.ts
echo "})" >> src/index.ts
echo "" >> src/index.ts
echo "app.listen(port, () => {" >> src/index.ts
echo "  console.log('the $1 app, is working properly on port: ', port)" >> src/index.ts
echo "});" >> src/index.ts

echo "-----------------------------------------------------"
echo "***** LOG - adding unit test sample"
echo "" >> test/SampleTest.spec.ts
# echo "test('this is a sample test', () => {" >> test/SampleTest.spec.ts
# echo "  const test = 'sample';" >> test/SampleTest.spec.ts
# echo "" >> test/SampleTest.spec.ts
# echo "  expect(test).toEqual('sample');" >> test/SampleTest.spec.ts
# echo "});" >> test/SampleTest.spec.ts
# echo "" >> test/SampleTest.spec.ts

fi
