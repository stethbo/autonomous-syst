# **0. automat skończony**

### **Automat skończony**

**Automat skończony** (ang. *finit state automata*) - abstrakcyjny, matematyczny, iteracyjny model obliczeń w teorii automatów oparty na tablicy dyskretnych przejść między jego kolejnymi stanami, do opisu których służy diagram stanów.

Formalnie automat skończony to piątka: $M = \{Q, \Sigma, \delta, q_0, F\}$

gdzie:
* $Q$ - zbiór stanów
* $\Sigma$ - to zbiór wejść (**alfabet**)
* $\delta: Q: \Sigma \rightarrow Q$ to funkcja przejść która mówi w jaki spsób przechodzimy po maszynie w reakcji na kolejne elementy ciągu w zależności od stanu w którym się znajdujemy
* $q_0$ - stan początkowy
* $F \subset Q$ - zbiór stanów akceptujących (podzbiór wszystkich stanów, może być właściwy)


Język jest regularny jeśli rozpoznaje go jakiś (jakikolwiek) automat skończony.

**Łańcuch Markowa** probabilistyczny analog automatu skończonego - jest modelem dobrym do prostych algorytmów, np. linia produkcyjna, mechanizm jazdy robota (ale bez algorytmów uczenia się)

### **Maszyna Touringa**

**Maszyna touringa** - to siódemka: $M = \{Q, \Sigma, \Gamma, \delta, q_0, q_r, q_a\}$
gdzie:\
* Q - zbiór stanów
* $\Sigma$ - alfabet wejściowy
* $\Gamma$ - alfabet taśmy, $\epsilon \in \Gamma, \Sigma \subseteq \Gamma$
* $\delta: Q \times \Gamma \times \{L, R\}$ to funkcja przejścia (taka głowica);
z danego stanu i alfabetu taśmy otrzymujemy stan, alfabet i krok (lewo / prawo)
* $q_0 \in Q$ - stan początkowy
* $q_a \in Q$ - stan akceptacji (tylko jeden)
* $q_r \in Q$ - stan odrzucenia $q_a \neq q_r$


**Język rozpoznawalny** przez MT (ang. Machine Recognizable Language) odnosi się do języka, który może być przetwarzany przez maszynę touringa (MT). Ciąg wejściowy należy do alfabetu taśmy.

**Język rozstrzygalny przez maszynę** touringa (MT) to taki język, dla którego istnieje algorytm jakaś MT która rozstrzyga ten język czyli zatrzymuje się dla każdego wejścia.

**Wielotaśmowa maszyna touringa** to maszyna touringa posiadająca kilka taśm. Każda taśma ma swoją głowicę a początkowo dane wejściowe zapisywane są na pierwszej taśmie a pozostałe taśmy są puste. 

**Niedeterministyczna maszyna Turinga (NMT)** jest maszyną Turinga, która nie zawsze wybiera jedno jedyne przechodzenie dla każdej możliwej kombinacji wejść. W przeciwieństwie do deterministycznych maszyn Turinga, NMT może wykonywać wiele możliwych ruchów na podstawie stanu i symboli odczytywanych z taśmy wejściowej. Dlatego też, NMT może mieć wiele potencjalnych dróg przez graf przejść, a nie tylko jedną jak w przypadku DMT. Niedeterminizm pozwala NMT na wykonywanie obliczeń i algorytmów szybciej niż deterministyczne maszyny Turinga.

**Alfabet** - dowolny, niepusty zbiór; nie ma znaczenia co tam jest, każdy obiekt może być alfabetemłania.

**Tekst** - skończony ciąg elementów alfabetu , ułożonych jeden za drugim, np:
(1, 1, 0, 1, 0); (c, c, c), (k, 9, $\gamma$)

Język to zbiór tekstów
np. {(0, 1, 1), (0, 0), $\epsilon$}; {(a), (b), (c), (d)}; {}\
$\epsilon$ to znak pusty (pusty tekst) może być częścią języka\
Język jest regularny, jeśli rozpoznaje go jakiś (jakikolwiek) automat skończony.






# **2. Złożoność czasowa**

*Niech MT zatrzymuje się na każdym wejściu. Złożoność czasowa **MT** to funkcja **f: {0, 1, 2, ...} -> {0, 1, 2, ...}** gdzie **f(n)** to maksymalna liczba kroków, w których MT zatrzyma się po podaniu wejścia o długości **n***

**Złożoność czasowa** odnosi się do ilości czasu potrzebnego do wykonania określonego algorytmu, operacji lub zadania przez komputer lub inny system przetwarzania informacji. Jest to miara ilości czasu, który musi zostać poświęcony na wykonanie danej operacji lub obliczenie wyniku. Zwykle wyrażana jest jako funkcja zależna od rozmiaru wejścia i określa, jak szybko algorytm lub operacja rośnie wraz ze wzrostem rozmiaru danych wejściowych. Złożoność czasowa jest jednym z kluczowych wskaźników wydajności algorytmów i służy do oceny stopnia trudności i efektywności przetwarzania danych. Im złożoność czasowa jest mniejsza, tym bardziej efektywny jest algorytm lub operacja.

### **Notacja asymptotyczna**

Notacja asymptotyczna jest matematyczną metodą opisującą złożoność czasową algorytmu. Polega na określeniu, jak szybko rośnie liczba operacji, jakie musi wykonać algorytm w stosunku do rozmiaru danych wejściowych. Notacja ta używana jest do porównywania efektywności różnych algorytmów i do przewidywania, jak długo będzie działał algorytm dla dużych rozmiarów danych. W notacji asymptotycznej używa się symboli O, Omega i Theta do opisu złożoności czasowej.

### **Duże O**

Duże O (ang. Big O) jest to notacja matematyczna, używana w analizie algorytmów, która opisuje ograniczenia górne na czas działania (złożoność czasową) danego algorytmu. Innymi słowy, duże O określa, jak bardzo czas działania algorytmu wzrasta wraz z liczbą danych wejściowych. Oznacza to, że jeśli czas działania algorytmu wynosi O(f(n)), to oznacza to, że czas ten rośnie wraz z ilośćią danych wejściowych w podobny sposób jak funkcja f(n), gdzie n to rozmiar danych wejściowych. Duże O jest często stosowane do porównywania złożoności czasowej różnych algorytmów i określania, który z nich zachowuje się najszybciej dla danej ilości danych wejściowych.

### **Omega**

Omega to notacja asymptotyczna, która oznacza dolną granicę złożoności czasowej algorytmu dla najgorszego przypadku. Innymi słowy, omega mówi nam, jaka jest najlepsza możliwa złożoność czasowa danego algorytmu. Oznacza to, że nawet gdy algorytm działa dla pewnych wejść w czasie krótszym niż dolna granica, to i tak jego złożoność czasowa jest conajmniej taka, jak wynosi wartość notacji omega.

### **teta**

Teta (oznaczane symbolem Θ) to notacja używana w teorii złożoności obliczeniowej, która definiuje górną granicę czasową działania algorytmu. Oznacza to, że czas działania algorytmu (w najgorszym przypadku) jest rzędu Θ(f(n)), gdzie f(n) to funkcja zależna od rozmiaru danych wejściowych algorytmu (n). Inaczej mówiąc, teta oznacza, że czas działania algorytmu nie przekroczy określonej funkcji, ale może być mniejszy.

### **małe o**

'Małe o' (oznaczane jako 'o') jest notacją asymptotyczną używaną w analizie złożoności czasowej algorytmów. Oznacza, że rozmiar danych wejściowych rośnie w sposób asymptotyczny szybciej niż funkcja złożoności czasowej algorytmu, czyli f(n) ∈ o(g(n)). Innymi słowy, można powiedzieć, że funkcja złożoności czasowej f(n) maleje wobec funkcji g(n), co oznacza, że temu, jak wydajnie działa algorytm, mało zależy od rozmiaru danych wejściowych w skali asymptotycznej.

### **małe omega w**

Małe omega w to określenie złożoności czasowej algorytmu, które oznacza dolną granicę czasu wykonania algorytmu w warunkach najgorszego przypadku. Oznacza to, że algorytm musi działać co najmniej tak długo jak wskazuje małe omega w, aby rozwiązać problem. Jest to oznaczenie asymptotyczne i oznacza, że czas wykonania algorytmu jest związany z rozmiarem problemu. Małe omega w jest często używane wraz z dużymi O, aby określić złożoność czasową algorytmu.

### **złożoność czasowa NMT**

Złożoność czasowa NMT odnosi się do analizy czasowej algorytmów przy użyciu sieci neuronowych do tłumaczenia maszynowego (NMT - neural machine translation). Złożoność czasowa odnosi się do liczby kroków obliczeniowych (operacji) potrzebnych do wykonania konkretnego algorytmu. Złożoność czasowa NMT określa czas, jaki jest potrzebny do przetworzenia wejścia (np. zdania w języku źródłowym) i wygenerowania odpowiedniego tłumaczenia w języku docelowym. Optymalizacja złożoności czasowej NMT jest ważnym aspektem projektowania algorytmów maszynowego tłumaczenia, zwłaszcza w kontekście zastosowań w czasie rzeczywistym lub na dużą skalę.

### **klasa złożoności TIME**

Klasa złożoności TIME jest to zestaw problemów decyzyjnych, które można rozwiązać w określonym czasie na maszynie Turinga. Czas ten jest zwykle mierzony w ilości kroków, które musi wykonać algorytm w celu rozwiązania problemu. Klasy złożoności TIME są podzielone na szereg podklas, takich jak TIME(O(n)) lub TIME(O(n^2)), odzwierciedlających różne poziomy złożoności czasowej. Wspomniane klasy złożoności czasowej są istotne w kontekście teorii obliczeń oraz algorytmiki i stanowią podstawę wielu badań naukowych w tym zakresie.

### **Klasa złożoności NTIME**

Klasa złożoności NTIME to zbiór problemów decyzyjnych, które mogą być rozwiązane przez niedeterministyczną maszynę Turinga w czasie oczekiwania ograniczonym przez funkcję jednej zmiennej n, gdzie n jest rozmiarem wejścia. Innymi słowy, NTIME jest klasą wszystkich problemów decyzyjnych, które mogą być rozwiązane w skończonym czasie przez niedeterministyczną maszynę Turinga. Klasa ta jest istotna w teorii obliczeń, ponieważ wiele algorytmów o wysokiej złożoności czasowej może być efektywnie rozwiązanych przez niedeterministyczne maszyny Turinga, a to może być wykorzystane do rozwiązania wielu praktycznych problemów związanych z obliczeniami.

### **Funkcja obliczalna w czasie wielomianowym**

Funkcja obliczalna w czasie wielomianowym to funkcja, która może zostać obliczona przez deterministyczny algorytm Turinga w czasie ograniczonym przez wielomian względem rozmiaru wejścia. Innymi słowy, jest to funkcja, która może być rozwiązana w stopniu złożoności czasowej O(n^k), gdzie n oznacza rozmiar wejścia a k jest stałą. Funkcje obliczalne w czasie wielomianowym uważane są za efektywnie obliczalną i praktycznie rozwiązywalną złożoność czasową.

### **Redukowalność w czasie wielomianowym**

Redukowalność w czasie wielomianowym oznacza, że problem może być rozwiązany przez algorytm w czasie rzędu wielomianowego względem rozmiaru danych wejściowych. Innymi słowy, problem może być szybko rozwiązany, co oznacza, że złożoność czasowa algorytmu jest proporcjonalna do wielomianu funkcji wejściowej. Redukowalność w czasie wielomianowym jest pożądanym celem w algorytmice, ponieważ umożliwia szybkie rozwiązywanie problemów, a także stanowi ważny wymóg dla wielu problemów NP-trudnych, które nie mają znanych szybkich algorytmów.

### **Problem NP-zupełny**

Problem NP-zupełny to problem decyzyjny, który należy do klasy NP i jest jednocześnie tak samo trudny co każdy inny problem w klasie NP. Oznacza to, że każdy problem NP może być zredukowany do rozwiązania problemu NP-zupełnego w czasie wielomianowym. Problem NP-zupełny jest jednym z najtrudniejszych problemów w informatyce, a istnieją pewne dowody, że nie ma skutecznego algorytmu szybszego niż eksponencjalny (w czasie O(2^n)) dla rozwiązania każdego problemu NP-zupełnego. Oznacza to, że rozwiązanie problemów NP-zupełnych wymaga zastosowania heurystyk, algorytmów przybliżonych lub sztucznej inteligencji.

### **Problem NP-trudny**

Problem NP-trudny (ang. NP-hard) to problem decyzyjny, dla którego nie ma znanej algorytmicznej procedury rozwiązania w czasie wielomianowym dla wszystkich jego instancji. Oznacza to, że rozwiązanie tego problemu wymaga czasu wykładniczego lub superwykładniczego w stosunku do rozmiaru danych wejściowych, a więc jest złożony obliczeniowo. Problem NP-trudny może stanowić podstawę do dowodzenia niemożności efektywnego rozwiązania pewnych innych problemów, a także jest kluczowym pojęciem w teorii złożoności obliczeniowej.

### **Model obliczeniowy RAM**

Model obliczeniowy RAM (ang. Random Access Machine) to abstrakcyjny model maszyny, który służy do opisu i porównywania złożoności obliczeniowej algorytmów. W modelu RAM zakłada się, że każda instrukcja maszyny jest wykonywana w jednostce czasu, a pamięć jest podzielona na stałą liczbę komórek, do których możemy odczytywać i zapisywać. Dzięki temu model ten pozwala na bardzo dokładne badanie złożoności czasowej algorytmów, ponieważ pomija wiele skomplikowanych i trudnych do formalnego opisania czynników, takich jak czas dostępu do danych na dysku czy przepustowość połączenia internetowego.

### **Konfiguracja**

Konfiguracja to określony stan systemu lub programu, w którym wszystkie jego elementy są ustawione na określone wartości. Jest to szczególnie istotne w kontekście analizy złożoności czasowej, ponieważ z jednej strony konfiguracja może wpłynąć na złożoność obliczeniową, z drugiej zaś złożoność czasowa może określić, jak długo zajmie osiągnięcie określonej konfiguracji danych wejściowych.

### **Program**

Program to zbiór instrukcji lub poleceń, które określają, jakie działania powinien wykonywać komputer w celu wykonania określonego zadania. Program może być napisany w różnych językach programowania i może mieć różną złożoność czasową, czyli czas potrzebny na wykonanie programu dla danego rozmiaru danych wejściowych.

### **Krok**

Krok to pojedyncza operacja wykonywana przez algorytm lub program komputerowy w celu przetworzenia danych. Krok może polegać na wykonywaniu prostych działań matematycznych, porównywaniu wartości lub manipulacji danymi w pamięci. W analizie czasowej algorytmów krok jest jednostką, która służy do pomiaru liczby operacji potrzebnych do przetworzenia danych wejściowych.



# **3. Grafy**

### **graf skierowany**

Graf skierowany lub Digraf to rodzaj grafu, w którym krawędzie skierowane są z jednego wierzchołka do drugiego. Innymi słowy, jeśli istnieje krawędź z wierzchołka A do wierzchołka B, to niekoniecznie istnieje krawędź z wierzchołka B do wierzchołka A. Graf skierowany może być wykorzystany do reprezentacji relacji skierowanych, takich jak przepływ informacji lub zależności hierarchiczne.

### **graf nieskierowany**

Graf nieskierowany to taki graf, w którym każda krawędź łączy dokładnie dwa wierzchołki, przy czym krawędzie te nie mają określonego kierunku. Zazwyczaj wierzchołki grafu nieskierowanego reprezentują jakieś obiekty, a krawędzie między nimi opisują związki lub relacje między tymi obiektami. Często grafy nieskierowane są wykorzystywane w różnych dziedzinach nauki, takich jak informatyka, matematyka, fizyka czy biologia.

### **scieżka Hamiltona**

Scieżka Hamiltona to taka scieżka w grafie nieskierowanym, która przechodzi przez każdy wierzchołek dokładnie raz. Innymi słowy, scieżka Hamiltona to droga, która odwiedza każdy wierzchołek grafu dokładnie jeden raz.

### **Weryfikaor**

Weryfikator (ang. verifier) w teorii grafów jest algorytmem lub programem, który przyjmuje na wejściu graf oraz pewne twierdzenie dotyczące tego grafu i stwierdza, czy twierdzenie to jest prawdziwe, czy fałszywe. Weryfikator może służyć do sprawdzania np. czy dany graf jest spójny, czy też czy istnieje w nim ścieżka łącząca dwa zadane wierzchołki. Weryfikator jest często używany wraz z algorytmem znajdowania rozwiązania problemu, aby zweryfikować poprawność tego rozwiązania w prosty i szybki sposób.



# **Algorytmy**

## **Sortowanie**

### **Sortowanie przez wstawianie**

INSERTION-SORT(A)
1. Wejście ciąg liczb $A = (a_0, a_1, a_2, ..., a_{n-1})$
2. Wyjście: posortowany cią liczb $b_i$ złożony dokładnie z wszystkich elementów *A*
```
A = {a_0, a_1, ..., a_n-1}

Dla i=1 do i=n-1:
    b := A[i]
    j := i-1
    Dopóki j >= 0 and a[j] > b:
        A[j+1] := A[j]
        j := j + 1
    A[j+1] := b
```
Złożoność $O(n^2)$.\
Sortowanie w miejscu.

### **Sortowanie bąbelokowe**

```
BUBBLE-SORT(A)
input: A = {a_0, a_1, a_2, ..., a_n-1}
output: posortowany ciąg A złożonych ze wszytkich elementów ciaŋu A

Dla i = n-1 do i = 1:
    Dla j = 0 do j = i-1:
        jeśli A[i] > A[i+1] to:
            zamień A[i], A[i+1]
```
Złożoność $O(n^2)$.\
Sortowanie w miejscu.

### **Sortowanie przez scalanie**

```
def merge_sort(arr):
    if len(arr) <= 1:
        return arr
    
    split_idx = len(arr) // 2
    left = arr[0:split_idx]
    right = arr[split_idx:-1]

    left = merge_sort(left)
    right = merge_sort(right)

    return left + right

```
Złożoność $O(n \log{n})$\
Sortowanie nie w miejscu

### **Sortowanie przez kopcowanie**
```
1. Zbuduj kopiec z ciągu wejściowego
2. Powtarzaj ażd o momentu gdy kompiec ma tylko jeden element
    3. Zamień korzeń z ostatnim elementem kopca
    4. Sciągnij ostatni element kopca (jest na odpowiedniej pozycji)
    5. Stwórz kopiec z pozostałych elementów
6. Posortowany ciąg uzyskujemy poprzez odwrócenie tablicy wyjściowej.
```
Złożoność $O(n \log{n})$\
Sortowanie w miejscu


### **Sortowanie szybkie**
```
QUICKSORT(A)
    Jeśli p < r to:
    >
```