## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2

## **步骤说明**

**1. 新建一个文件夹，并使用 vs code 打开，执行如下命令**

```terminal
npm init -y //生成package配置文件
tsc -init   //生成ts配置文件
```

**2.在根目录下新建 build 和 src 文件夹，再在根目录下新建 index.html 文件，修改 tsconfig.json 文件内容如下**

```json
{
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
		"outDir": "./build" /* 编译后的文件路径. */,
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

**3. 在 src 目录下，新建一个 page.ts 文件，内容如下**

```ts
consolg.log('测试')
```

- 在终端执行 tsc 命令对.ts 文件进行编译后，并在 index.html 中引入对应的 js 文件

```terminal
tsc
```

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!--引入编译后的js文件-->
		<script src="./build/page.js"></script>
		<title></title>
	</head>

	<body></body>
</html>
```

**4. 在浏览器中查看 index.html 文件，如果按 F12 可以看到打印的内容，说明已经的搭建好了**

**5. 页面模块化处理,在 page.ts 中通过类的方式实现主页的头部、内容部分和底部的内容，并通过 tsc 命令编译 ts 文件**

```ts
// 页面头部内容
class Header {
	constructor() {
		const elem = document.createElement('div')
		elem.innerText = 'This is Header'
		document.body.appendChild(elem)
	}
}

// 页面内容
class Content {
	constructor() {
		const elem = document.createElement('div')
		elem.innerText = 'This is Content'
		document.body.appendChild(elem)
	}
}

// 页面底部内容
class Footer {
	constructor() {
		const elem = document.createElement('div')
		elem.innerText = 'This is Footer'
		document.body.appendChild(elem)
	}
}

// 实例化
class Page {
	constructor() {
		new Header()
		new Content()
		new Footer()
	}
}
```

**6. 实例化主页，在 index.html 文件的 body 标签内引入 script 标签，实例化 page,代码如下**

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="./build/page.js"></script>
		<title></title>
	</head>

	<body>
		<!--实例化page-->
		<script>
			new Page()
		</script>
	</body>
</html>
```

**7. 通过浏览器预览效果，通过编译后的 js 文件可知使用了大量的全局变量，不易于我们代码的维护**

**8. 命名空间的使用,优化 page.ts 文件和 index.html 文件**

```ts
// 通过namespace优化，使其只暴露Home
namespace Home {
	class Header {
		constructor() {
			const elem = document.createElement('div')
			elem.innerText = 'This is Header'
			document.body.appendChild(elem)
		}
	}

	// 页面内容
	class Content {
		constructor() {
			const elem = document.createElement('div')
			elem.innerText = 'This is Content'
			document.body.appendChild(elem)
		}
	}

	// 页面底部内容
	class Footer {
		constructor() {
			const elem = document.createElement('div')
			elem.innerText = 'This is Footer'
			document.body.appendChild(elem)
		}
	}

	export class Page {
		constructor() {
			new Header()
			new Content()
			new Footer()
		}
	}
}
```

```html
<script>
	new Home.Page()
</script>
```

**9. 组件化，在 src 目录下新建一个文件 components.ts，编写代码如下**

```ts
namespace Components {
	export class Header {
		constructor() {
			const elem = document.createElement('div')
			elem.innerText = 'This is Header'
			document.body.appendChild(elem)
		}
	}

	export class Content {
		constructor() {
			const elem = document.createElement('div')
			elem.innerText = 'This is Content'
			document.body.appendChild(elem)
		}
	}

	export class Footer {
		constructor() {
			const elem = document.createElement('div')
			elem.innerText = 'This is Footer'
			document.body.appendChild(elem)
		}
	}
}
```

- 在 page.ts 中使用这些组件，代码如下：

```ts
namespace Home {
	export class Page {
		constructor() {
			new Components.Header()
			new Components.Content()
			new Components.Footer()
		}
	}
}
```

- 在 index.html 中引入 components.js 文件

```html
<script src="./build/page.js"></script>
<script src="./build/components.js"></script>
```

**10. 多文件编译成一个文件，直接打开 tsconfig.json 文件，然后找到 outFile 配置项，这个就是用来生成一个文件的设置，但是如果设置了它，就不再支持"module":"commonjs"设置了，我们需要把它改成"module":"amd",然后在去掉对应的 outFile 注释，设置成下面的样子。**

```json
{
	"module": "amd",
	"outFile": "./build/page.js"
}
```

- 配置好后，删除掉 build 下的 js 文件，然后用 tsc 进行再次编译。

- 删掉 index.html 文件中的 component.js,在浏览器里就可以正常运行的。

#### 注意事项

- namespace 支持嵌套
