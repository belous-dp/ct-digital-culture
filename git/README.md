# Git

Задания, в основном, взяты с [этого сайта](https://gitexercises.fracz.com/).

## Решение задания commit-one-file-staged

```sh
git restore --staged "B.txt"
git commit -m "commit-one-file-staged"
```

## Решение задания ignore-them

```sh
cat > .gitignore
*.exe
*.o
*.jar
/libraries/
^D
git add .
git commit -m "ignore them"
```

## Решение задания merge-conflict

```sh
git merge another-piece-of-work
vim equation.txt
# поменял файл
git add equation.txt
git commit -m "meh"
```

## Решение задания save-your-work

```sh
git stash
# bugfix
git commit -m "bug fixed i am a genius"
git stash pop
# Finally, finished it!
git commit -am "stashing is nice"
```

## Решение задания change-branch-history

```sh
git rebase hot-bugfix
```

## Решение задания forge-date

```sh
git commit --amend --no-edit --date="Mon Jun 22 04:20:00 1987 +0300"
```

## Решение задания fix-old-typo

```sh
git rebase -i
# в редакторе изменил команду напротив коммита "Add Hello wordl" с pick на edit
# пофиксил ошибку в файле
git add .
git commit --amend -m "Add Hello world"
git rebase --continue
# merge conflict
git add .
git rebase --continue
```

## Решение задания commit-lost

```sh
git reflog
git reset --hard 1df0e58
```

## Решение задания too-many-commits

```sh
git rebase -i
# напротив последнего коммита поставил squash чтобы смерджить его с предыдущим
```

## Решение задания executable

```sh
git update-index --chmod=+x script.sh
git commit -m "hmmm suspicious executable file"
# возможно стоило заамендить с предыдущим коммитом
```

## Решение задания commit-parts

```sh
git add --patch file.txt
# Stage this hunk? e
# меняем строчки, не относящиеся к task1 с + на # чтобы они не закоммитились
git commit -m "task1"
git add .
git commit -m "task2"
```

## Решение задания invalid-order

```sh
git rebase -i
# меняем две строчки местами
# ???
# PROFIT
```

## Решение задания search-improved

```sh
git bisect start HEAD 1.0 -- cool-cheatsheet.txt
git bisect run ./faulty-check
# вернул плохой коммит
# ./faulty-check
# echo $?
# вернул 0, значит мы сейчас на 1 коммит раньше плохого
git push origin 7a384ea3:search-improved # ура победа

# пасиб за курс, было интересно разбираться
# Оказывается, есть много классных команд
# когда находишь бинпоиск, а потом ещё и автоматический тест со скриптом,
# вообще кайф, всё само работает
```
