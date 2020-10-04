## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2
- [配置文件选项说明](https://www.tslang.cn/docs/handbook/compiler-options.html)

## **步骤说明**

**1. typescript 配置文件（tsconfig.json）**

```terminal
tsc -init  //生成配置文件的命令
```

- 打开 tsconfig.json 文件，找到 complilerOptions 属性下的 removeComments:true 选项，把注释去掉。
- 在终端上直接运行 tsc 命令，这时候 tsconfig.json 才起作用

**2. include、exclude 和 files 属性配置**

- ts-node 命令遵循 tsconfig.json 配置标准
- tsconfig.json 文件配置

```json
{
	// include 编译指定文件，exclude 除了什么文件不编译， files 和include类似
	"include": ["demo8.ts"],
	//or
	//"exclude": ["demo8.ts"],
	//or
	//"files": ["demo8.ts"],
	// compilerOptions配置项
	"compilerOptions": {
		/* Visit https://aka.ms/tsconfig.json to read more about this file */

		/* Basic Options */
		// "incremental": true,                   /* Enable incremental compilation */
		"target": "es5",
		/* Specify ECMAScript target version: 'ES3' (default), 'ES5', 'ES2015', 'ES2016', 'ES2017', 'ES2018', 'ES2019', 'ES2020', or 'ESNEXT'. */
		"module": "commonjs",
		/* Specify module code generation: 'none', 'commonjs', 'amd', 'system', 'umd', 'es2015', 'es2020', or 'ESNext'. */
		// "lib": [],                             /* Specify library files to be included in the compilation. */
		// "allowJs": true,                       /* Allow javascript files to be compiled. */
		// "checkJs": true,                       /* Report errors in .js files. */
		// "jsx": "preserve",                     /* Specify JSX code generation: 'preserve', 'react-native', or 'react'. */
		// "declaration": true,                   /* Generates corresponding '.d.ts' file. */
		// "declarationMap": true,                /* Generates a sourcemap for each corresponding '.d.ts' file. */
		"sourceMap": true /* ts文件到js文件的映射，部署时开启，可用于排错 */,
		// "outFile": "./",                       /* Concatenate and emit output to single file. */
		"outDir": "./dist" /* 编译后的文件路径. */,
		"rootDir": "./src" /* 源文件路径. */,
		// "composite": true,                     /* Enable project compilation */
		// "tsBuildInfoFile": "./",               /* Specify file to store incremental compilation information */
		"removeComments": true,
		/* Do not emit comments to output. */
		// "noEmit": true,                        /* Do not emit outputs. */
		// "importHelpers": true,                 /* Import emit helpers from 'tslib'. */
		// "downlevelIteration": true,            /* Provide full support for iterables in 'for-of', spread, and destructuring when targeting 'ES5' or 'ES3'. */
		// "isolatedModules": true,               /* Transpile each file as a separate module (similar to 'ts.transpileModule'). */

		/* Strict Type-Checking Options */
		"strict": true,
		/* Enable all strict type-checking options. */
		// "noImplicitAny": true,                 /* Raise error on expressions and declarations with an implied 'any' type. */
		// "strictNullChecks": true,              /* Enable strict null checks. */
		// "strictFunctionTypes": true,           /* Enable strict checking of function types. */
		// "strictBindCallApply": true,           /* Enable strict 'bind', 'call', and 'apply' methods on functions. */
		// "strictPropertyInitialization": true,  /* Enable strict checking of property initialization in classes. */
		// "noImplicitThis": true,                /* Raise error on 'this' expressions with an implied 'any' type. */
		// "alwaysStrict": true,                  /* Parse in strict mode and emit "use strict" for each source file. */

		/* Additional Checks */
		// "noUnusedLocals": true,                /* Report errors on unused locals. */
		// "noUnusedParameters": true,            /* Report errors on unused parameters. */
		// "noImplicitReturns": true,             /* Report error when not all code paths in function return a value. */
		// "noFallthroughCasesInSwitch": true,    /* Report errors for fallthrough cases in switch statement. */

		/* Module Resolution Options */
		// "moduleResolution": "node",            /* Specify module resolution strategy: 'node' (Node.js) or 'classic' (TypeScript pre-1.6). */
		// "baseUrl": "./",                       /* Base directory to resolve non-absolute module names. */
		// "paths": {},                           /* A series of entries which re-map imports to lookup locations relative to the 'baseUrl'. */
		// "rootDirs": [],                        /* List of root folders whose combined content represents the structure of the project at runtime. */
		// "typeRoots": [],                       /* List of folders to include type definitions from. */
		// "types": [],                           /* Type declaration files to be included in compilation. */
		// "allowSyntheticDefaultImports": true,  /* Allow default imports from modules with no default export. This does not affect code emit, just typechecking. */
		"esModuleInterop": true,
		/* Enables emit interoperability between CommonJS and ES Modules via creation of namespace objects for all imports. Implies 'allowSyntheticDefaultImports'. */
		// "preserveSymlinks": true,              /* Do not resolve the real path of symlinks. */
		// "allowUmdGlobalAccess": true,          /* Allow accessing UMD globals from modules. */

		/* Source Map Options */
		// "sourceRoot": "",                      /* Specify the location where debugger should locate TypeScript files instead of source locations. */
		// "mapRoot": "",                         /* Specify the location where debugger should locate map files instead of generated locations. */
		// "inlineSourceMap": true,               /* Emit a single file with source maps instead of having a separate file. */
		// "inlineSources": true,                 /* Emit the source alongside the sourcemaps within a single file; requires '--inlineSourceMap' or '--sourceMap' to be set. */

		/* Experimental Options */
		// "experimentalDecorators": true,        /* Enables experimental support for ES7 decorators. */
		// "emitDecoratorMetadata": true,         /* Enables experimental support for emitting type metadata for decorators. */

		/* Advanced Options */
		"skipLibCheck": true,
		/* Skip type checking of declaration files. */
		"forceConsistentCasingInFileNames": true /* Disallow inconsistently-cased references to the same file. */
	}
}
```

#### 注意事项
