{:fennel-path "./?.fnl;./?/init.fnl;src/?.fnl;src/?/init.fnl"
 :macro-path "./?.fnl;./?/init-macros.fnl;./?/init.fnl;src/?.fnl;src/?/init-macros.fnl;src/?/init.fnl"
 :lua-version "lua54"
 :libraries {:tic-80 false}
 :extra-globals "vim modules case love fennel where"
 :lints {:unused-definition true
         :unknown-module-field true
         :unnecessary-method true
         :bad-unpack true
         :var-never-set true
         :op-with-no-arguments true
         :multival-in-middle-of-call true}}
