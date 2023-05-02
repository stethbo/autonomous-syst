# Plik. 1
**Zad. 1 Wyjaśnij przeznaczenie poszczególnych bitów rejestru STATUS.**

Rejestr STATUS jest rejestrem stanu używanym w wielu mikrokontrolerach i mikroprocesorach. Zawiera on wiele bitów, z których każdy pełni określoną rolę:

- bit C: przeniesienie - ustawiany wtedy, gdy poprzednia operacja matematyczna spowodowała przeniesienie (ang. carry)
- bit DC: połowa przeniesienia - ustawiany wtedy, gdy poprzednia operacja matematyczna spowodowała przeniesienie w połowie wartości (ang. half-carry)
- bit Z: zero - ustawiany wtedy, gdy wynik poprzedniej operacji matematycznej jest równy 0
- bit S: znak - ustawiany wtedy, gdy wynik poprzedniej operacji matematycznej jest ujemny
- bit P/V: parzystość/przepełnienie - używany w niektórych architekturach procesorów do sygnalizowania błędu przepełnienia (ang. overflow)
- bit N: ustawiany wtedy, gdy ostatnio wykonana operacja była odejmowaniem (ang. subtract)

Dzięki wykorzystaniu tych bitów, można np. w łatwy sposób sprawdzić, czy wynik ostatniej operacji matematycznej spełnia określone warunki, co może być przydatne w wielu sytuacjach.

**Zad. 2 Wyjaśnij sposób oprogramowywania wyświetlacza HD44780. Wyjaśnij jakie instrukcje są niezbędne do wyświetlenia**

Tekstu na wyświetlaczu HD44780, a także jakie funkcje są dostępne dzięki temu oprogramowaniu.

Wyświetlacz HD44780 to popularny rodzaj wyświetlacza alfanumerycznego opieranego na technologii LCD. Do obsługi takiego wyświetlacza potrzebne jest oprogramowanie kontrolera, który stoi za działaniem tego urządzenia. W programowaniu tego typu wyświetlaczy stosowane są instrukcje sterujące umożliwiające kontrolę nad wyświetlanym tekstem, kursorami oraz innymi elementami interfejsu. 

Podstawowe instrukcje, które są niezbędne do wyświetlenia tekstu to między innymi:

- Instrukcja ustawienia trybu 4-bitowego lub 8-bitowego komunikacji,
- Instrukcja ustawienia liczby wierszy i kolumn wyświetlacza,
- Instrukcja ustawienia trybu kursora,
- Instrukcja włączenia i wyłączenia wyświetlacza,
- Instrukcja ustawienia położenia kursora.

Dodatkowo, w oparciu o te instrukcje można zaimplementować szereg funkcji, takich jak:

- Wpisywanie tekstu na wyświetlacz,
- Przesuwanie tekstu w lewo lub w prawo,
- Włączanie i wyłączanie migania kursora,
- Zmienianie jasności wyświetlacza.

Programowanie wyświetlacza HD44780 to proces stosunkowo prosty, jednak wymaga dobrej znajomości instrukcji kontrolera, aby móc tworzyć zaawansowane funkcje i interfejsy. Dzięki właściwemu programowaniu możliwe jest uzyskanie wygodnego i przejrzystego interfejsu użytkownika w różnego rodzaju urządzeniach elektronicznych, takich jak zegarki, liczniki, kontrolery i wiele innych.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Dany jest czujnik opisany równaniem różniczkowym:

dy/dt = a*y + b*x

gdzie:
- y(t) jest wynikiem pomiaru czujnika w chwili t
- x(t) jest wartością sygnału wejściowego w chwili t
- a, b są stałymi współczynnikami charakteryzującymi czujnik

Równanie to opisuje dynamikę czujnika, czyli sposób w jaki reaguje on na zmiany sygnału wejściowego x(t). Im większe wartości a i b, tym bardziej czuły jest czujnik na zmiany sygnału wejściowego. Równanie to może być stosowane do modelowania różnych typów czujników, takich jak termometry, barometry czy akcelerometry.

# Plik. 2
**Zad. 1 Wyjaśnij sposoby adresacji pamięci programu w mikrokontrolerze PIC16f877A.**

Mikrokontroler PIC16f877A ma ograniczone możliwości adresacji pamięci w porównaniu do bardziej zaawansowanych mikrokontrolerów. Adresacja pamięci w tym mikrokontrolerze może odbywać się na kilka sposobów:

1. Adresowanie bezpośrednie - Polega na bezpośrednim odwoływaniu się do adresu pamięci w instrukcji. Na przykład, instrukcja: "MOVWF 0x20" przeniesie wartość rejestru roboczego do adresu 0x20 w pamięci danych.

2. Adresowanie za pomocą rejestru wskazującego - Wykorzystując rejestry wskaźnika (W), można odnieść się do jednego adresu pamięci z danymi lub instrukcji. Przykładowo, instrukcja "MOVWF FSR" przenosi wartość rejestru roboczego (W) do rejestru wskaźnika (FSR), który może służyć do adresowania pamięci.

3. Adresowanie za pomocą rejestru i przesunięcia - Ten sposób adresacji pamięci umożliwia przesyłanie do pamięci adresu, który jest przesunięciem w ramach zawartości rejestru wskaźnika. Przykładowo, jeśli FSR ma wartość 0x10, to instrukcja "MOVWF 0x0 (FSR)" przeniesie wartość rejestru roboczego do adresu pamięci 0x10.

4. Adresowanie za pomocą stałej i rejestru - Zastosowanie stałej (lub literału) i rejestru umożliwia dostęp do adresu pamięci, którego wartość jest wynikiem dodania wartości rejestru roboczego do podanej stałej. Przykładowo, instrukcja "MOVLW 0x0A, ADDWF 0x20,W" pobierze wartość 0x0A do rejestru roboczego, doda ją do zawartości adresu 0x20 w pamięci danych i wynik przenosi do rejestru roboczego.

5. Adresowanie za pomocą indeksowania - Umożliwia to dostęp do pamięci poprzez przypisanie do adresu pamięci wartości liczbowej lub zawartości rejestru. Na przykład, instrukcja "MOVF TBL, W, 0x1" przeniesie wartość z tablicy pamięci o adresie TBL do rejestru roboczego (W) i inkrementuje adres TBL o 1.

**Zad. 2 Wyjaśnij sposób działania konwertera analogowo-cyfrowego. Wyjaśnij jakie instrukcje są niezbędne do wykonania**

Konwerter analogowo-cyfrowy to urządzenie, które zamienia sygnał analogowy (np. dźwięk, obraz, temperaturę) na sygnał cyfrowy, przeznaczony do przetwarzania i interpretacji przez komputer. 

W procesie konwersji analogowo-cyfrowej najpierw sygnał jest próbkowany, co oznacza, że jest on pobierany przez konwerter w równych odstępach czasowych. Następnie, każda próbka jest kwantowana, co oznacza, że jej wartość jest zaokrąglana do najbliższej wartości na skali cyfrowej.

Wynikające z tego próbkowanie i kwantowanie mogą prowadzić do błędów, zwanych błędami kwantyzacji, które mogą wpłynąć na jakość sygnału. Aby zmniejszyć ryzyko tych błędów, konwertery wykorzystują różne techniki, takie jak oversampling, noise shaping i filtrowanie cyfrowe.

Aby korzystać z konwertera analogowo-cyfrowego, potrzebne są instrukcje, które pozwalają na ustawienie różnych parametrów konwersji, takich jak częstotliwość próbkowania i liczba bitów na próbkę. Należy także określić sposób, w jaki sygnał wejściowy jest podłączany do konwertera (np. za pomocą interfejsu USB, portu szeregowego lub złącza Ethernet).

W niektórych przypadkach, szczególnie gdy chodzi o aplikacje specjalistyczne, może być konieczne dostosowanie konfiguracji konwertera analogowo-cyfrowego do indywidualnych potrzeb użytkownika. W takim przypadku potrzebne będzie programowanie w językach takich jak C, C++ lub Python.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Dany czujnik może być opisany równaniem różniczkowym, jeśli jego zachowanie jest opisane przez zmiany w czasie. Przykładowo, dany czujnik temperatury może być opisany równaniem różniczkowym związanym z prawem zmiany temperatury w czasie w danym punkcie. Równanie różniczkowe opisujące zachowanie czujnika może mieć różne postacie w zależności od rodzaju czujnika i jego specyfikacji. Ogólnie, równanie różniczkowe opisujące zachowanie czujnika może być wykorzystane do określenia jego dokładności, czułości i innych parametrów.

# Plik. 3
**Zad. 1 Wyjaśnij sposoby adresacji pamięci danych w mikrokontrolerze PIC16f877A.**

W mikrokontrolerze PIC16f877A, pamięć danych może być adresowana na kilka sposobów:

1. Adresowanie bezpośrednie - adresowane są bezpośrednio rejestry, które przechowują dane. W tym przypadku, adres rejestru wskazuje na konkretny rejestr w pamięci danych.

2. Adresowanie pośrednie - adresowane są rejestry wskaźnikowe, które wskazują na miejsce, gdzie przechowywane są dane. W tym przypadku, nie jest konieczne podanie bezpośredniego adresu pamięci, lecz wskaźnik wskazuje na nią.

3. Adresowanie indeksowe - stosowane jest w przypadku dostępu do tablic lub struktur danych. Adres pamięci jest obliczany na podstawie wartości indeksu oraz offsetu.

4. Adresowanie autoinkrementacyjne - pozwala na dynamiczne zmienianie adresu pamięci przy każdym odwołaniu do niego. W przypadku ustawienia bitu INDF Auto-Increment (INC), adres pamięci zostaje zwiększony o 1 po każdym odczycie lub zapisie.

5. Adresowanie bezwzględne - adres pamięci jest podawany wprost, bezpośrednio w instrukcji. W tym przypadku, możliwe jest odwołanie się do dowolnego miejsca w pamięci danych.

**Zad. 2 Układ jest przedstawiony jak na rysunku, gdzie R1= 50Ω to impedancja układu zasilania, a Rs= 300Ω to**

rezystancja źródła sygnału. Występuje tutaj także kondensator C1 o pojemności 100nF.

 Rysunek:
                           |------Rs------+    
                           |               |   
                           |               C1    
                       R1 _|_             
                           |      
                           |       
                          ---              
                           |      
                          GND 

Aby obliczyć impedancję układu, należy połączyć impedancje R1 oraz kondensatora C1, tworząc impedancję Z1:

Z1 = 1 / (jωC1 + 1/R1)

gdzie ω to pulsacja sygnału.

Następnie dodajemy rezystancję źródła sygnału Rs do impedancji Z1, otrzymując całkowitą impedancję układu:

Z = Rs + Z1

Na tej podstawie można wyznaczyć amplitudę i fazę sygnału na całkowitej impedancji Z.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Dany czujnik opisany jest równaniem różniczkowym, które opisuje jego zachowanie w czasie. Jest to równanie, które mówi, jak zmieniają się wartości mierzonej wielkości w zależności od czasu. Równanie to zazwyczaj jest zależne od wielu czynników, takich jak temperatura, wilgotność powietrza, ciśnienie atmosferyczne i inne, które mogą wpływać na wynik pomiaru. Często równanie to jest opisywane za pomocą równania różniczkowego pierwszego lub drugiego stopnia, które można rozwiązać numerycznie lub analitycznie, aby uzyskać wartości mierzonej wielkości w czasie.  Jednym z przykładów czujnika opisanego równaniem różniczkowym jest czujnik temperatury, którego działanie można opisać równaniem różniczkowym pierwszego stopnia.

# Plik. 4
**Zad. 1 Przedstaw i opisz elementy pamięci programu mikrokontrolera PIC16f877A.**

Mikrokontroler PIC16f877A ma następujące elementy pamięci:

1. Pamięć programu (flash): jest to pamięć, w której znajdują się instrukcje programu. Może pomieścić do 14 336 słów (1 słowo = 14 bitów).

2. Pamięć danych RAM: jest to pamięć, w której program przechowuje zmienne i bufory. Może pomieścić do 368 bajtów.

3. Pamięć FIFO: jest to pamięć, która służy do przechowywania danych w trybie kolejki. Jest używana w łączności asynchronicznej i Synchronous Serial Port (SSP).

4. Pamięć EEPROM: jest to pamięć, w której program może przechowywać dane trwałe. Może pomieścić do 256 bajtów.

5. Pamięć rejestrowa: jest to zestaw specjalnych rejestrów w mikrokontrolerze, które przechowują stany flag, adresy, wartości i inne dane ważne dla działania programu.

6. Pamięć stosu: jest to specjalna pamięć w mikrokontrolerze, która służy do przechowywania adresów powrotu i danych operacyjnych w trakcie wykonywania funkcji.

7. Pamięć wektorów przerwań: jest to pamięć, w której przechowywane są adresy funkcji obsługujących przerwania.

**Zad. 2 Wyjaśnij sposób działania silnika krokowego w trybie z pełnym krokiem i jedną fazą aktywną, oraz w trybie z pełnym**

krokiem i dwoma fazami aktywnymi.

Silnik krokowy jest elektromechanicznym układem składającym się z jednej lub kilku faz, w których przepływa prąd zmieniający kierunek w określonych momentach, prowadząc do obracania się wału silnika. Sposób działania silnika krokowego zależy od trybu pracy, czyli liczby faz aktywnych.

W trybie z pełnym krokiem i jedną fazą aktywną do silnika jest podawany impuls elektryczny, który włącza jedną fazę (np. fazę A) na zasadzie przemiany stanów logicznych. Po pewnym czasie impuls jest zatrzymywany (stan nieaktywny). W kolejnym kroku do silnika jest podawany kolejny impuls, który włącza fazę B, a następnie znowu następuje przerwa. Ten cykl jest kontynuowany, a każda faza odpowiada za obrót wału silnika o określoną wartość kąta.

W trybie z pełnym krokiem i dwoma fazami aktywnymi do silnika jest podawany impuls elektryczny, który włącza dwie fazy jednocześnie (np. fazy A i B). Te dwie fazy utworzą pole magnetyczne, które przyciągnie do siebie kolejne zęby wału. Następnie impuls jest zatrzymywany, a na kolejnym kroku podawane są kolejne dwie fazy (np. fazy B i C), aż do obrócenia wału o odpowiednią liczbę kroków.

W obu trybach pracy silnik krokowy wykonuje obrót o określoną wartość kąta, który zależy od liczby faz i kąta podzielonego na pełne kroki. Przy zwiększeniu liczby faz aktywnych następuje zwiększenie dokładności obrotu. Silnik krokowy jest często stosowany w urządzeniach precyzyjnych, takich jak roboty przemysłowe, drukarki, urządzenia medyczne, itp.

**Zad. 3 Wyznacz (przybliżoną) liniową charakterystykę wejściowo-wyjściową czujnika, dla którego zebrano doświadczalnie**

nie następujące pomiary:

| Wejście    | Wyjście   |
|-----------|-----------|
| 0         | 0         |
| 10        | 2         |
| 20        | 4         |
| 30        | 6         |
| 40        | 8         |

Aby wyznaczyć przybliżoną liniową charakterystykę wejściowo-wyjściową czujnika należy skorzystać z równania prostej y = kx + b, gdzie y jest wyjściem czujnika, x jest wejściem czujnika, k jest współczynnikiem kierunkowym, a b jest przesunięciem w pionie.

Najpierw należy obliczyć wartość k:

k = (y2 - y1) / (x2 - x1) = (2 - 0) / (10 - 0) = 0.2

Następnie można obliczyć wartość b, korzystając ze wzoru:

b = y - kx

Średnia wartość wyjścia dla x = 0:

y_avg = (y1 + y2) / 2 = (0 + 2) / 2 = 1

b = y_avg - k * x_avg = 1 - 0.2 * 5 = 0

Ostatecznie, liniowa charakterystyka wejściowo-wyjściowa czujnika wynosi:

y = 0.2x + 0

Jest to równanie prostej przechodzącej przez punkty (0,0) i (40,8), która reprezentuje przybliżoną liniową relację między wejściem i wyjściem czujnika.

# Plik. 5
**Zad. 1 Przedstaw i opisz podstawowe elementy pamięci mikrokontrolera PIC16f877A.**

1. Pamięć programu (FLASH) - to pamięć, w której przechowywany jest program zarządzający pracą mikrokontrolera. Zawiera ona instrukcje do wykonania przez procesor.

2. Pamięć danych SRAM - to pamięć, w której przechowywane są zmienne oraz wyniki pośrednie obliczeń.

3. Pamięć EEPROM - to pamięć nieulotna, w której przechowywane są dane, które nie powinny być tracone przy wyłączeniu zasilania.

4. Przetwornik analogowo-cyfrowy (ADC) - to układ umożliwiający odczytanie sygnału analogowego i zamianę go na sygnał cyfrowy, który może być przetwarzany przez mikrokontroler.

5. Moduł licznika/odbiornika czasu (Timer/Counter) - to układ umożliwiający pomiar czasu oraz generację sygnałów o określonym czasie trwania.

6. Interfejsy komunikacyjne - mikrokontroler PIC16f877A posiada wiele interfejsów komunikacyjnych, takich jak UART, SPI czy I2C, umożliwiających komunikację z innymi urządzeniami.

7. Wejścia/wyjścia (I/O) - mikrokontroler posiada wiele portów wejścia/wyjścia, które umożliwiają podłączenie różnych urządzeń zewnętrznych, takich jak przyciski, diody, czujniki, silniki itp.

8. Procesor - to główny element mikrokontrolera, odpowiedzialny za przetwarzanie danych i wykonywanie instrukcji programu. W przypadku PIC16f877A jest to procesor RISC o taktowaniu do 20 MHz.

**Zad. 2 Wyjaśnij zjawiska zachodzące w złączu P-N.**

Złącze p-n to połączenie dwóch warstw półprzewodników: p (z dodatnim nośnikiem ładunku) i n (z ujemnym nośnikiem ładunku) o przeciwnych ładunkach i różnych stężeniach domieszkujących. 

Podczas tworzenia złącze p-n dochodzi do dyfuzji nośników ładunku, czyli przeniku elektronów z obszaru n do p (dziury) oraz dziur do obszaru n (elektrony). Ten proces prowadzi do zmniejszenia stężenia nośników ładunku z obu stron złącza.

Kiedy złącze jest rożnicowane w kierunku przewodzenia "przodem" (P do N), to elektrodny przycisk zostaje zaktywowany blokując ruch dziur i elektronów z każdej strony złącza. Zmniejsza to potencjał dyfuzyjny i powoduje, że obszar złącza jest obszarem o wysokiej impedancji elektrostatycznej, a przycisk ten jest oznaczany jako przycisk barierowy. 

Prąd płynący przez złącze jest zwykle bardzo niewielki, a przepływ nośników zależy od różnicy potencjału między obszarami p i n, a także od barier potencjału. W złączu w kierunku odwrotnym przepływ nośników jest hamowany, a zwiększenie stosowanej siły elektromotorycznej powoduje przepływ prądu tylko pod warunkiem przekroczenia wartości napięcia zapłonowego. 

W związku z tym, zjawiska zachodzące w złączu pn, to dyfuzja nośników ładunku i przepływ prądu w zależności od kierunku napięcia zasilającego.

# Plik. 6
**Zad. 1 Opisz sposób działania stosu i instrukcje wykorzystywane do jego obsługi w mikrokontrolerach klasy PIC18fxx2 i**

Stos to struktura danych, w której elementy są dodawane lub usuwane tylko z jednego końca. W mikrokontrolerach klasy PIC18fxx2 stos jest implementowany w pamięci RAM i służy do przechowywania adresów powrotu do wywołującej funkcji, wartości rejestrów i zmiennych lokalnych.

Instrukcje wykorzystywane do obsługi stosu to:

- PUSH - dodaje wartość ze wskazanego rejestru na szczyt stosu.
- POP - usuwa wartość ze szczytu stosu i zapisuje ją do wskazanego rejestru.
- CALL - dodaje adres powrotu na stos i przechodzi do wskazanej funkcji.
- RET - usuwa adres powrotu ze stosu i wraca do wywołującej funkcji.

Przykład użycia stosu w programie w języku assembler dla mikrokontrolera PIC18fxx2:

ORG 0x00
START:
    CALL FUNCTION
    ; powrót z funkcji do START
    RET

FUNCTION:
    ; dodanie wartości 0x05 na stos
    MOVLW 0x05
    PUSH WREG
    ; dodanie wartości 0x0A na stos
    MOVLW 0x0A
    PUSH WREG
    ; usunięcie wartości ze szczytu stosu i zapisanie jej do rejestru
    POP REG1
    ; usunięcie wartości ze szczytu stosu i zapisanie jej do rejestru
    POP REG2
    ; dodanie wartości z rejestru REG1 i REG2 i wynik zapisanie na stosie
    ADDWF REG1, W
    PUSH WREG
    ; powrót do START
    RET

W powyższym przykładzie wartość 0x05 jest najpierw dodawana na stos za pomocą instrukcji PUSH, a następnie jest pobierana ze szczytu stosu za pomocą instrukcji POP i zapisywana do rejestru REG1. Podobnie, wartość 0x0A jest dodana na stos, pobrana ze szczytu stosu i zapisana do rejestru REG2. Następnie te dwie wartości są dodawane za pomocą instrukcji ADDWF i wynik jest zapisywany na stosie. Na koniec funkcja zwraca wartość i wraca do wywołującej funkcji za pomocą instrukcji RET.

**Zad. 2 Oblicz, jaka jest ruchliwość manipulatora SCARA.**

Ruchliwość manipulatora SCARA można obliczyć jako liczbę stopni swobody (DoF). Typowy manipulator SCARA ma 4 stopnie swobody, co oznacza, że ​​ma 4 niezależne ruchy lub kierunki, w których może poruszać narzędzie końcowe. Te 4 stopnie swobody odpowiadają ruchom:

1. Przesunięcie w poziomie (ruch poziomy w płaszczyźnie roboczej)
2. Przesunięcie w pionie (ruch pionowy w płaszczyźnie roboczej)
3. Obrót wokół własnej osi w płaszczyźnie roboczej
4. Obrót wokół osi pionowej mocowania podstawy (jeśli manipulator ma taką funkcjonalność)

Warto jednak zaznaczyć, że w zależności od konstrukcji manipulatora, liczba stopni swobody może być różna.

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie**

Zadanie kinematyki polega na wyznaczeniu położenia końcowego manipulatora w zależności od kąta obrotu łącza. Zatem, aby rozwiązać to zadanie, należy przeprowadzić kilka kroków:

1. Zdefiniuj układ współrzędnych – w tym przypadku można przyjąć układ kartezjański, w którym początek układu znajduje się w punkcie podstawy manipulatora, a oś X ukierunkowana jest wzdłuż łącza obrotowego.

2. Narysuj schemat manipulatora – w tym przypadku będzie to jedno łącze obrotowe, zamocowane na bazie.

3. Wyznacz macierz przekształcenia – w celu wyznaczenia położenia końcowego manipulatora w zależności od kąta obrotu należy wyznaczyć macierz przekształcenia odwzorowującą ruch łącza obrotowego. Ponieważ mamy do czynienia z jednym łączem, a oś obrotu jest jednocześnie osią X układu współrzędnych, macierz przekształcenia przyjmuje postać:

T = [cos θ -sin θ 0 0;
sin θ cos θ 0 0;
0 0 1 l 0;
0 0 0 1 0]

gdzie θ to kąt obrotu łącza, l to długość łącza, a 0 to wartość dla pozostałych współrzędnych.

4. Wykonaj operacje na macierzy – aby uzyskać położenie końcowe manipulatora wystarczy pomnożyć macierz przekształcenia przez wektor położenia początkowego końca manipulatora (dla θ=0) i wykonać odpowiednie operacje na wynikowej macierzy. W końcowym wyniku, współrzędne x, y i z określają położenie końcowe manipulatora.

Przykładowo, jeśli długość łącza wynosi l=1, a kąt obrotu θ=45°, to po wykonaniu powyższych kroków, można otrzymać, że położenie końcowe manipulatora wynosi:

x = 0.707; y = 0.707; z = 1.

Oznacza to, że końcowy punkt manipulatora znajduje się w odległości pierwiastka kwadratowego z 2 od początku układu współrzędnych w kierunku X i Y oraz na wysokości 1 od płaszczyzny X-Y.

# Plik. 7
**Zad. 1 Wyjaśnij znaczenie ﬂag konﬁguracji w mikrokontrolerze PIC16f877A**

Flagi konfiguracji w mikrokontrolerze PIC16f877A to specjalne bity, które umożliwiają ustawienie różnych trybów pracy mikrokontrolera. Flagi te kontrolują podstawowe funkcje takie jak włączanie i wyłączanie przerwań, tryby konwersji A/D, ustawianie prędkości zegara procesora, tryby programowania i wiele innych. Ustawienie odpowiednich flag konfiguracji jest ważnym etapem projektowania układów opartych na mikrokontrolerze, ponieważ ma to wpływ na wydajność i funkcjonalność całej aplikacji.

**Zad. 2 Oblicz, jaka jest ruchliwość (typowego) manipulatora ramieniowego.**

Ruchliwość manipulatora ramieniowego zależy od liczby stopni swobody. Standardowy manipulator ramieniowy ma 6 stopni swobody, co oznacza, że może się poruszać w 6 różnych kierunkach. Jest to najbardziej popularny typ manipulatora w przemyśle, ponieważ zapewnia dużą precyzję i elastyczność w wykonywaniu różnych zadań.

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na**

wirniku silnika.

Nie zostało podane warunków początkowych, dlatego ciężko jest dokładnie rozwiązać to zadanie, ale przyjmując pewne założenia możemy przedstawić przykładowe rozwiązanie.

Załóżmy, że manipulator zaczyna ruch w pozycji pionowej, a jego cel to obrócenie się wokół osi pionowej o kąt 45 stopni. Długość łącza pryzmatycznego wynosi 1 metr, a wirnik silnika obraca się z prędkością 1000 obr./min.

W celu wykonania tego zadania musimy znać równania kinematyki manipulatora. Jednym z najważniejszych jest równanie przemieszczenia, które wyraża się wzorem:

s = rΔφ

gdzie:
- s oznacza przemieszczenie (w metrach)
- r to promień okręgu, po którym porusza się manipulator (w metrach)
- Δφ to kąt obrotu (w radianach)

Z tego wzoru wynika, że im większy promień okręgu, po którym porusza się manipulator, tym mniejszy musi być jego kąt obrotu, aby osiągnąć zadane przemieszczenie.

W naszym przykładzie manipulator porusza się po okręgu o promieniu 1 metra, dlatego dla obrotu o 45 stopni (czyli Δφ = π/4 rad) przemieszczenie wyniesie:

s = 1 * π/4 = 0,7854 metra

Kolejnym równaniem kinematycznym, które musimy znać, jest wzór na prędkość liniową, wyrażający prędkość, z jaką porusza się manipulator. W przypadku manipulatora z jednym łączem pryzmatycznym można to przedstawić w następujący sposób:

v = rω

gdzie:
- v to prędkość liniowa (w metrach na sekundę)
- r to promień okręgu, po którym porusza się manipulator (w metrach)
- ω to prędkość kątowa (w radianach na sekundę)

W naszym przypadku, zakładając prędkość kątową wirnika silnika na poziomie 1000 obr./min (czyli ω = 104,72 rad/s), prędkość liniowa wyniesie:

v = 1 * 104,72 = 104,72 m/s

Jest to dość duża prędkość, dlatego przed rozpoczęciem ruchu bardzo ważne jest zadbanie o bezpieczeństwo pracy manipulatora oraz otoczenia, w którym się znajduje.

# Plik. 8
**Zad. 1 Czym jest histereza w układach wejściowo-wyjściowych.**

Histereza w układach wejściowo-wyjściowych to zjawisko, w którym wartość wyjściowa nie zależy tylko od wartości wejściowej w danym momencie, ale również od historii zmian wartości wejściowej. Innymi słowy, histereza występuje, gdy zmiana wartości wejściowej nie powoduje natychmiastowej i dokładnej zmiany wartości wyjściowej, ale na wpływają na nią zmiany wykonywane wcześniej. Jest to zjawisko powszechne w wielu układach mechanicznych, elektrycznych i sterujących. Przykładem histerezy może być sytuacja, w której dźwignia urządzenia pozostanie w pozycji otwartej, nawet gdy wartość wejściowa się zmieniła, a dopiero gdy ta wartość zostanie zmieniona o wiele większą ilość, dźwignia zacznie się poruszać.

**Zad. 2 Wykonaj obrót punktu [1,1,1]o30◦dookoła wektora [0.5,0.4,0.3]. Zamieść odpowiednie obliczenia.**

Najpierw obliczamy długość wektora [0.5, 0.4, 0.3]:

sqrt(0.5^2 + 0.4^2 + 0.3^2) ≈ 0.745

Następnie normalizujemy ten wektor, czyli dzielimy jego składowe przez jego długość:

[0.5/0.745, 0.4/0.745, 0.3/0.745] ≈ [0.671, 0.536, 0.402]

Mamy teraz wektor jednostkowy, który posłuży nam jako oś obrotu.

Aby wykonać obrót punktu [1, 1, 1] o 30 stopni wokół tego wektora, możemy użyć wzoru:

p' = cos(θ) * p + sin(θ) * (k x p) + (1 - cos(θ)) * (k * p) * k

gdzie:
- p to punkt, który obracamy
- p' to wynikowy punkt po obróceniu
- θ to kąt obrotu (30 stopni w tym przypadku)
- k to wektor jednostkowy, określający oś obrotu

Pierwszą operacją, jaką musimy wykonać, jest produkt wektorowy k x p. Możemy to zrobić następująco:

[0.671, 0.536, 0.402] x [1, 1, 1] =
[0.536 - 0.402, -0.402 + 0.402, 0.402 - 0.536] =
[0.134, 0, -0.134]

Teraz możemy obliczyć kolejne składowe wzoru:

cos(30) ≈ 0.866
sin(30) ≈ 0.5

k x p = [0.134, 0, -0.134]
sin(θ) * (k x p) = [0.067, 0, -0.067]
(k * p) * k = [0.536, 0.536, 0.402] * 0.671 ≈ [0.359, 0.359, 0.269]
(1 - cos(θ)) * (k * p) * k = (1 - 0.866) * [0.359, 0.359, 0.269] ≈ [0.049, 0.049, 0.037]

Ostatecznie, podstawiając wszystkie wartości do wzoru, otrzymujemy:

[1, 1, 1] -> [1.438, 1.276, 0.865]

Nowy punkt to [1.438, 1.276, 0.865].

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie i połą-**

czonego z końcówką, która porusza się translacyjnie wzdłuż osi łącza.

Załóżmy, że:
- długość łącza obrotowego to L
- odległość pomiędzy osią obrotu bazy a osią obrotu łącza to a
- odległość pomiędzy osią obrotu łącza a osią translacji końcówki to d
- kąt obrotu łącza to q

Zdefiniujmy także ramiona jako R1, R2, R3 i R4, kolejno od bazy do łącza, od łącza do osi translacji końcówki, od osi translacji do punktu chwytu oraz od punktu chwytu do końcówki.

Zaczynając od bazy, parametry DH to:
- R0: a=0, d=0, q=0, alpha=0 (bazowy układ współrzędnych, osie zgodne z układem świata)

Przechodząc do łącza, parametry DH to:
- R1: a=0, d=0, q=q, alpha=-pi/2 (obrotowe połączenie ze zmieniającym się kątem, osie x i y obrócone o -pi/2 względem układu bazy)

Przechodząc do osi translacji końcówki, parametry DH to:
- R2: a=L, d=0, q=0, alpha=pi/2 (przesuwny połączenie ze stałym kątem 0, osie y i z obrócone o pi/2 względem układu łącza)

Przechodząc do punktu chwytu, parametry DH to:
- R3: a=0, d=d, q=0, alpha=-pi/2 (przesuwny połączenie ze stałym kątem 0, osie x i y obrócone o -pi/2 względem układu translacji)

Przechodząc na końcówkę, parametry DH to:
- R4: a=0, d=0, q=0, alpha=0 (zwyczajne połączenie, osie zgodne z układem świata)

Ostatecznie, zestawienie parametrów DH dla manipulatora opisanego powyżej wygląda następująco:
- R0: a=0, d=0, q=0, alpha=0
- R1: a=0, d=0, q=q, alpha=-pi/2
- R2: a=L, d=0, q=0, alpha=pi/2
- R3: a=0, d=d, q=0, alpha=-pi/2
- R4: a=0, d=0, q=0, alpha=0

# Plik. 9
**Zad. 1 W jaki sposób zjawisko piezoelektryczne jest wykorzystywane do budowy mikrofonów.**

Zjawisko piezoelektryczne jest wykorzystywane do budowy mikrofonów poprzez wykorzystanie specjalnych kryształów piezoelektrycznych, takich jak kwarc czy turmalin. Kryształ taki jest umieszczany w mikrofonie i poddawany wibracjom wywołanym przez dźwięki, które mają zostać zarejestrowane. Wibracje te wpływają na kryształ piezoelektryczny, który generuje na swoich końcach napięcie elektryczne proporcjonalne do siły tych wibracji. Napięcie to jest następnie wzmacniane i przetwarzane w sygnał dźwiękowy, który może być zapisany lub przesłany na dalsze urządzenia. Dzięki temu właśnie zjawisku piezoelektrycznemu możliwe jest nagrywanie dźwięków i głosów oraz ich przekazywanie za pomocą mikrofonów.

**Zad. 2 Wyjaśnij sposób oprogramowywania wyświetlacza HD44780. Wyjaśnij jakie instrukcje są niezbędne do wyświetlenia**

Tekstu na wyświetlaczu HD44780 można programować za pomocą kontrolera mikroprocesora. Ten kontroler HD44780 jest stosowany w większości sterowników wyświetlaczy LCD. Wykorzystuje on interfejs równoległy do komunikacji z mikrokontrolerem i umożliwia sterowanie wyświetlaczem poprzez komunikację jednokierunkową.

Aby wyświetlić tekst na wyświetlaczu HD44780, należy najpierw zainicjować urządzenie. Inicjalizacja składa się z napisania kilku instrukcji, które ustawiają parametry wyświetlacza, takie jak liczba wierszy, tryb kursu lub tryb adresowania. Instrukcje te są wysyłane z mikrokontrolera na kontroler urządzenia poprzez 8-bitową szynę danych i 3 przewody sterujące.

Po zainicjowaniu wyświetlacza, możemy wyświetlić tekst korzystając z następujących instrukcji:

1. CGRAM (Character Generator RAM) – używane do zapisania niestandardowych znaków

2. DDRAM (Display Data RAM) – używane do wyświetlania tekstu na ekranie

Następnie, musimy ustawić pozycję kursora, aby wiedzieć, gdzie umieścić tekst. Ustawienie pozycji kursora odbywa się za pomocą instrukcji DDRAM, która umieszcza kursor w określonym miejscu.

Oto przykładowy kod programowania wyświetlacza HD44780 w języku C:

#include "lcd.h" // plik nagłówkowy dla obsługi wyświetlacza

int main(void)
{
 LCD_init(); // inicjalizacja wyświetlacza
 LCD_puts("Hello World!"); // wyświetla tekst "Hello World!" na ekranie
 while(1);

 return 0;
}

W tym przykładzie "LCD_init()" jest funkcją inicjalizacyjną, a "LCD_puts()" wyświetla tekst na ekranie. Cały program jest nieskończoną pętlą kontrolną, która zapobiega zakończeniu działania programu.

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na bazie i**

posiadającego jeden przegub obrotowy na końcu łącza.

Parametry DH można wyznaczyć według następujących kroków:

Krok 1: Oznaczenie osi i przegubów robota.

Przyjmujemy, że osie robota układu współrzędnych są takie same jak osie DH:

    * oś z przegubu 1 (baza) - osia z
    * oś z przegubu 2 (obrotowy) - osia x

Krok 2: Określenie zmiennych DH.

W przypadku manipulatora z jednym łączem potrzebujemy czterech zmiennych DH:

    * d - odległość między osiami z i x, jest równa długości łącza
    * $\theta$ - kąt pomiędzy osią z a osią x, jest to kąt obrotu przegubu 2
    * a - odległość między osiami x i y, jest równa 0 dla tego manipulatora
    * $\alpha$ - kąt pomiędzy osią x a osią y, jest równy 0 dla tego manipulatora

Krok 3: Określenie macierzy transformacji.

Aby określić macierz transformacji z jednego układu współrzędnych do drugiego, trzeba wziąć pod uwagę wartości zmiennych DH. W tym przypadku macierz transformacji wygląda następująco:

c$\theta$ -s$\theta$ 0 0

s$\theta$ c$\theta$ 0 0

0 0 1 d

0 0 0 1

gdzie c$\theta$ oznacza cos($\theta$), a s$\theta$ oznacza sin($\theta$).

Krok 4: Wyznaczanie parametrów DH.

Na podstawie macierzy transformacji można wyznaczyć zmiennych DH:

    * $d$ - odległość między osiami z i x, jest równa wartości $d_{4,3}$ = d = łącze
    * $\theta$ - kąt obrotu przegubu 2, jest równy wartości atan2($a_{3,2}$, $a_{3,1}$) = atan2(0,1) = 0
    * $a$ - odległość między osiami x i y, jest równa wartości $a_{1,2}$ = a = 0
    * $\alpha$ - kąt pomiędzy osią x a osią y, jest równy wartości atan2($a_{2,3}$, $a_{1,3}$) = atan2(sin($\theta$), cos($\theta$)) = $\theta$

Zatem parametry DH dla tego manipulatora to:

    * $d$ = łącze
    * $\theta$ = 0
    * $a$ = 0
    * $\alpha$ = $\theta$ = 0

Ostatecznie, macierz transformacji dla tego manipulatora ma postać:

1 0 0 0

0 1 0 0

0 0 1 d

0 0 0 1

# Plik. 10
**Zad. 1 Wyjaśnij sposób działania termopary i łańcucha termicznego.**

Termopary to urządzenia pomiarowe, które wykorzystują zjawisko Seebecka do pomiaru temperatury. Zjawisko to polega na powstawaniu siły elektromotorycznej w przewodniku, gdy różnica temperatur jest między jego dwoma końcami. W termoparze składającym się z dwóch różnych metali, powstające siły elektromotoryczne są proporcjonalne do różnicy temperatur między końcami. Ta różnica napięcia jest mierzona i przeliczana na temperaturę za pomocą tabel termostatycznych.

Łańcuch termiczny to system lub proces transportu energii cieplnej z jednego punktu do drugiego, wykorzystujący różne elementy termiczne, takie jak termopary, termometry oporowe czy czujniki temperatury typu RTD. Proces ten wymaga przesyłania energii cieplnej z miejsca o wyższej temperaturze do miejsca o niższej temperaturze. W łańcuchu termicznym ważne jest wyznaczenie strumienia ciepła między źródłem a odbiornikiem, jak również prędkość przepływu ciepła przez poszczególne elementy termiczne. Wykorzystanie łańcucha termicznego jest niezwykle istotne w przemyśle, zwłaszcza w procesach produkcyjnych, gdzie kontrola temperatur jest kluczowa dla zachowania jakości produktów i procesów produkcyjnych.

**Zad. 2 Wyjaśnij sposób działania konwertera analogowo-cyfrowego. Wyjaśnij jakie instrukcje są niezbędne do wykonania**

Konwerter analogowo-cyfrowy (ADC) to urządzenie, które przetwarza sygnał analogowy (np. napięcie) na sygnał cyfrowy (binarny). Istnieją różne sposoby działania, ale najczęściej stosowane to metoda aproksymacji oraz metoda sukcesywnego przybliżania.

Metoda aproksymacji działa na zasadzie porównywania napięcia wejściowego z pewnym napięciem odniesienia i stopniowym zmniejszaniu przedziału, w którym może znajdować się wejściowe napięcie. Wynikowy sygnał cyfrowy odpowiada numerowi kroku, w którym napięcie zostało odnalezione.

Metoda sukcesywnego przybliżania działa na podobnej zasadzie, ale zamiast zmniejszania przedziału, wykorzystuje stopniowe dodawanie lub odejmowanie napięcia odniesienia, aż do momentu, gdy zostanie osiągnięty sygnał wejściowy. Wynikowa liczba cyfrowa reprezentuje ilość kroków, potrzebnych do osiągnięcia sygnału wejściowego.

Do wykonania konwersji analogowo-cyfrowej, musimy wykonać kilka instrukcji:

1. Konfiguracja ADC - ustawienie parametrów pracy, takich jak prędkość konwersji oraz poziom odniesienia.

2. Inicjalizacja ADC - uruchomienie konwertera oraz przygotowanie do pracy.

3. Start konwersji - pobranie próbki sygnału analogowego i przekazanie jej do konwertera.

4. Odczyt wyniku - otrzymanie liczby cyfrowej (np. w postaci rejestru) reprezentującej sygnał analogowy.

W zależności od potrzeb, konwersja może być wykonywana jednorazowo lub w trybie ciągłym. W przypadku pracy w trybie ciągłym, konwersja jest wykonywana automatycznie dla kolejnych próbek sygnału.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

:

$\frac{dx}{dt} = kx$

gdzie:

$x$ - wartość mierzona przez czujnik,

$t$ - czas,

$k$ - stała proporcjonalności.

Równanie to opisuje proces, w którym wartość mierzonej przez czujnik wielkości zmienia się proporcjonalnie do jej aktualnej wartości. Stała $k$ określa szybkość zmian wartości mierzonej przez czujnik. Im większa wartość $k$, tym szybciej wartość mierzona będzie się zmniejszać lub zwiększać.

# Plik. 11
**Zad. 1 Wyjaśnij sposób działania kamery CCD.**

Kamera CCD (Charge-Coupled Device) składa się z matrycy setek tysięcy lub milionów pikseli, z których każdy rejestruje intensywność światła padającego na niego. Piksele te są złożone z pól półprzewodników, które przechowują ładunki elektryczne w sposób proporcjonalny do ilości światła padającego na nie.

W momencie gdy światło pada na piksel, elektrony przenoszą się z pola półprzewodnikowego w kierunku elektrody zasilającej dzięki efektowi fotoelektrycznemu. Następnie, ładunki są przesuwane przez układ poziomych i pionowych przewodów, tak zwany układ sterowania odczytem (ang. readout register), do specjalnego układu analogowo-cyfrowego konwertera (ang. ADC - Analog-to-Digital Converter), który tłumaczy sygnał analogowy na cyfrowy.

Istnieją różne sposoby organizacji przewodów układu sterowania odczytem, ale najczęściej stosowanymi są architektury "frame transfer" i "interline transfer". W przypadku pierwszej, składającej się z dwóch matryc CCD, jedna matryca zajmuje się zbieraniem naświetlonego obrazu, podczas gdy druga jest używana do realizacji przetwarzania obrazu. W drugim przypadku przewody układu sterowania odczytem są zamontowane wewnątrz pikseli, dzięki czemu jest ona bardziej kompaktowa i osiąga wyższą prędkość niż architektura "frame transfer".

W procesie odczytu każdego piksela, sygnał jest wzmacniany i przekształcany w postać cyfrową, a następnie zapisywany w pamięci kamery. W ten sposób, obraz jest tworzony z wielu pikseli, które są odczytywane sekwencyjnie i zapisywane na karcie pamięci kamery.

Kamery CCD znajdują zastosowanie w wielu różnych dziedzinach, w tym w systemach telewizyjnych, przemysłowych, medycznych i naukowych. Dzięki ich wysokiej rozdzielczości i czułości na światło, kamery CCD są idealnym wyborem do wykonywania zdjęć i filmów o wysokiej jakości i ostrości.

**Zad. 2 Układ jest przedstawiony jak na rysunku, gdzie R1= 50Ω to impedancja układu zasilania, a Rs= 300Ω to**

impedancja źródłowa.

Nie jest jasne, jakie jest pytanie. Proszę podać pełne pytanie.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Dany jest czujnik opisany równaniem różniczkowym, które opisuje jego zachowanie w czasie:

dy/dt = f(y, t)

gdzie y oznacza stan czujnika, t oznacza czas, a f jest funkcją opisującą sposób, w jaki y zmienia się w czasie.

Równanie to opisuje, jak sygnał pochodzący z czujnika (oznaczony jako y) zmienia się w czasie, w zależności od wartości czasu t oraz charakterystyki czujnika zdefiniowanej przez funkcję f.

Rozwiązanie tego równania pozwala na określenie, jak sygnał pochodzący z czujnika będzie zmieniał się w czasie oraz jak reagować na jego zmiany. Rozwiązania tego typu równań są często stosowane w różnych dziedzinach, takich jak fizyka, inżynieria, biologia czy ekonomia, by opisywać i przewidywać zachowanie różnych procesów i zjawisk.

# Plik. 12
**Zad. 1 Wyjaśnij sposób działania konwertera analogowo-cyfrowego. Zamieść niezbędne obliczenia.**

Konwerter analogowo-cyfrowy (ADC) jest urządzeniem, które przekształca sygnał analogowy na postać cyfrową. Działanie ADC polega na próbkowaniu sygnału analogowego co określony czas oraz kwantowaniu – przyporządkowaniu wartości cyfrowej do amplitudy próbek. 

Proces ten można przedstawić następująco:

1. Sygnał analogowy jest podawany na wejście ADC.
2. Sygnał jest próbkowany z określoną częstotliwością f_s, która jest wyrażana w Hz (np. 10 kHz). 
3. Następnie sygnał jest kwantowany, czyli przetwarzany na wartości dyskretne z określoną rozdzielczością. Rozdzielczość określana jest przez liczbę bitów użytych do zapisu wartości cyfrowej. Im więcej bitów, tym mniejsze skoki między kolejnymi wartościami cyfrowymi. Na przykład: 
   - dla 8 bitów rozdzielczości (typowy zakres 0-255), każda jednostka zmiany sygnału odpowiada zmianie o około 0,4% maksymalnej wartości sygnału.
   - dla 16 bitów rozdzielczości (typowy zakres 0-65535), każda jednostka zmiany sygnału odpowiada zmianie o około 0,0015% maksymalnej wartości sygnału.
4. Wartości cyfrowe zostają zapisane w pamięci ADC i są gotowe do przetworzenia przez cyfrowy układ elektroniczny. 

Obliczenia:

Częstotliwość próbkowania f_s jest odwrotnością czasu trwania jednej próbki T_s, czyli: 
f_s = 1/T_s

Rozdzielczość ADC dla n bitów wynosi:
R = (V_max - V_min)/(2^n)

gdzie V_max to maksymalna wartość sygnału analogowego, a V_min to minimalna wartość sygnału analogowego. 

Przykładowo, dla ADC o rozdzielczości 12 bitów i zakresie 0-5 V, rozdzielczość wynosi: 
R = (5 V - 0 V)/(2^12) = 0,00122 V

Oznacza to, że każda jednostka zmiany sygnału odpowiada zmianie o około 0,024% maksymalnej wartości sygnału.

**Zad. 2 Wyjaśnij sposób działania silnika krokowego w trybie z pełnym krokiem i jedną fazą aktywną, oraz w trybie z pełnym**

krokiem i dwoma fazami aktywnymi.

Silnik krokowy to urządzenie, które przekształca impulsy elektryczne dostarczane na jego cewki w ruch mechaniczny. W trybie z pełnym krokiem i jedną fazą aktywną do przeprowadzenia każdego pełnego kroku, potrzebna jest zmiana stanu jednej fazy. W kolejnych etapach, każda cewka zmienia swój stan, co powoduje ruch osi. W przypadku takiego trybu, silnik krokowy obraca się z mniejszą prędkością, ale z większą siłą.

Natomiast w trybie z pełnym krokiem i dwoma fazami aktywnymi, każda kolejna cewka zostaje aktywowana naprzemiennie, dzięki czemu osiągane jest większe przyspieszenie i większa prędkość obrotowa przy mniejszej mocy. Dzięki manipulacji sygnałami elektrycznymi, silnik krokowy obraca się z większą prędkością, ale z mniejszą siłą.

W obu trybach, kontroler silnika krokowego musi ustawić kolejność aktywacji faz, aby zapewnić odpowiedni kierunek ruchu i odpowiednią ilość kroków odpowiednio do wymagań aplikacji. Częstotliwość sygnałów elektrycznych dostarczanych do cewek, decyduje o prędkości obrotowej silnika.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Dany czujnik może być opisany równaniem różniczkowym w postaci:

y'(t) = f(x(t), y(t), t)

gdzie y jest wartością wyjściową czujnika, x jest wartością wejściową, t jest czasem, a f jest funkcją opisującą charakterystykę czujnika.

W zależności od konkretnego czujnika, funkcja f może mieć różną postać i zależeć od wielu czynników, takich jak temperatura, wilgotność, ciśnienie, natężenie oświetlenia czy intensywność pola magnetycznego.

Równanie różniczkowe opisujące czujnik jest ważne, ponieważ umożliwia predykcję jego zachowania w czasie oraz pozwala na opracowanie odpowiedniej strategii kalibracji i ustawienia.

# Plik. 13
**Zad. 1 Wyjaśnij sposób działania konwertera cyfrowo-analogowego. Zamieść niezbędne obliczenia.**

Konwerter cyfrowo-analogowy (DAC) jest urządzeniem, które przyjmuje cyfrowy sygnał wejściowy i przekształca go na analogowy sygnał wyjściowy. Proces ten polega na przydzieleniu wartości sygnału cyfrowego do odpowiednich poziomów napięcia na wyjściu konwertera.

DAC zwykle składa się z trzech głównych komponentów: rejestru przesuwnego, przetwornika wagowego i wzmacniacza.

Rejestr przesuwny służy do przechowywania kolejnych bitów sygnału cyfrowego i przesuwania ich przez system, aby uzyskać kolejne wartości sygnału. Przetwornik wagowy przetwarza wartości bitów z rejestru przesuwnego na napięcia odpowiednie dla każdej wartości. Oddzielne przetworniki wagowe mają różną precyzję, aby osiągnąć odpowiednią jakość sygnału.

Wzmacniacz służy do wzmocnienia sygnału wyjściowego do odpowiedniego poziomu napięcia, który będzie odpowiedni dla urządzeń odbiorczych, takich jak głośniki lub przetworniki sygnału.

Obliczenia dotyczące działania konwertera cyfrowo-analogowego obejmują dobranie napięć minimalnego i maksymalnego, potrzebnych do uzyskania odpowiedniego zakresu sygnału wyjściowego. Przykładowo, jeśli DAC ma zakres wyjściowy od 0 do 5 woltów i przetwornik wagowy ma 8 bitów, obliczenia będą wyglądać następująco:

- Wartość minimalna sygnału cyfrowego: 00000000 (0)
- Wartość maksymalna sygnału cyfrowego: 11111111 (255)
- Zakres wartości przetworzonych na napięcie: 0-5V
- Wartość napięcia dla każdej wartości sygnału cyfrowego: 5 / 255 = ~0.0196 V

Następnie, w celu uzyskania wartości sygnału analogowego dla konkretnej wartości cyfrowej, ta wartość zostaje pomnożona przez wartość napięcia dla każdego bitu wagowego i dodana do siebie, aby uzyskać sumaryczną wartość napięcia dla całego sygnału analogowego.

**Zad. 2 Wyjaśnij zjawiska zachodzące w złączu P-N.**

Złącze półprzewodnikowe typu P-N składa się z dwóch warstw półprzewodników z różnymi rodzajami przewodnictwa. Warstwa typu P ma nadmiar dziurek, które są nośnikami ładunków dodatnich, natomiast warstwa typu N ma nadmiar elektronów, które są nośnikami ładunków ujemnych.

W złączu P-N zachodzi zjawisko wyścielania, czyli migracja nośników ładunku na granicy pomiędzy dwoma różnymi typami półprzewodników. W wyniku tego procesu następuje nierównomierne rozłożenie ładunków po obu stronach złącza. Na tej granicy powstaje pole elektryczne, które prowadzi do zatrzymania dalniejszej migracji nośników.

W złączu P-N dochodzi również do zjawiska rekombinacji, czyli spotkania elektronów i dziurek i tworzenia par związanych ladunkowo. Podczas tego procesu powstaje energia, która może być emitowana w postaci fotonów. Ten efekt wykorzystywany jest w diodach LED, gdzie energia emitowana jest w postaci światła.

Kolejnym zjawiskiem zachodzącym w złączu P-N jest dioda prostownicza, gdzie połączenie warstwy typu P z dodatnim biegunem zasilacza, a warstwa typu N z ujemnym biegunem pozwala na przepływ prądu jednokierunkowego. Prąd sprzyja dalszej rekombinacji nośników ładunków, co prowadzi do zwiększenia pola elektrycznego na złączu.

Ogólnie rzecz biorąc, w złączu P-N zachodzą bardzo interesujące zjawiska, które umożliwiają wykorzystanie półprzewodników w wielu dziedzinach, takich jak elektronika, przemysł, energetyka i wiele innych.

**Zad. 3 Wyznacz (przybliżoną) liniową charakterystykę wejściowo-wyjściową czujnika, dla którego zebrano doświadczalnie**

następujące pomiary:

| Wejście [V] | Wyjście [mA] |
|------------|--------------|
| 0          | 0            |
| 1.5        | 15           |
| 2.5        | 25           |
| 3.5        | 35           |
| 4.5        | 45           |
| 5          | 50           |

Aby wyznaczyć przybliżoną liniową charakterystykę wejściowo-wyjściową czujnika, musimy znaleźć równanie prostej, która najlepiej odwzoruje te punkty pomiarowe. Możemy to zrobić za pomocą metody najmniejszych kwadratów.

Najpierw wyznaczmy średnie wartości wejścia i wyjścia:

$$\overline{x} = \frac{\sum{x_i}}{n} = \frac{0 + 1.5 + 2.5 + 3.5 + 4.5 + 5}{6} = 2.5$$

$$\overline{y} = \frac{\sum{y_i}}{n} = \frac{0 + 15 + 25 + 35 + 45 + 50}{6} = 28.33\text{ mA}$$

Następnie wyznaczmy różnice między pomiarami a średnimi wartościami:

$$\Delta x_i = x_i - \overline{x}$$

$$\Delta y_i = y_i - \overline{y}$$

|i  |$x_i$|$y_i$|$\Delta x_i$|$\Delta y_i$|$\Delta x_i^2$|$\Delta x_i \Delta y_i$|
|---|---|---|---------|---------|------------|-------------|
|1  |0  |0  |-2.5     |-28.33   |6.25        |70.83        |
|2  |1.5|15 | -1      |-13.33   |1           |13.33        |
|3  |2.5|25 | 0.5     |-3.33    |0.25        |-1.67        |
|4  |3.5|35 | 1.5     | 6.67    |2.25        |10.03        |
|5  |4.5|45 | 2.5     |16.67    |6.25        |41.67        |
|6  |5  |50 | 2.5     |21.67    |6.25        |54.17        |
|Σ  |2.5|28.33|0      |0        |22          |188.33       |

Następnie wyznaczmy współczynniki prostej przy użyciu wzorów:

$$k = \frac{\sum{\Delta x_i\Delta y_i}}{\sum{\Delta x_i^2}} = \frac{188.33}{22} = 8.56\text{ mA/V}$$

$$b = \overline{y} - k\overline{x} = 28.33 - 8.56 \cdot 2.5 = 6.67\text{ mA}$$

Ostatecznie, równanie prostej przybliżającej charakterystykę wejściowo-wyjściową czujnika wynosi:

$$y = 8.56x + 6.67$$

Możemy teraz użyć tego równania, aby przewidzieć wartości wyjścia dla różnych wartości wejścia, które nie były objęte pomiarami eksperymentalnymi. Jednak należy pamiętać, że przybliżona charakterystyka liniowa może nie być dokładna w całym zakresie działania czujnika.

# Plik. 14
**Zad. 1 Wyjaśnij zastosowanie Supervisor-a w oprogramowaniu Webots. Pokaż jak i jakie instrukcje służą do odczytywania**

i modyfikowania parametrów symulacji za pomocą Supervisor-a.

Supervisor w Webots to proces, który zarządza symulacją robotów i środowiska. Jego głównym zadaniem jest kontrolowanie symulacji, w tym modyfikowanie parametrów, odczytywanie informacji o robotach i zmiana zachowania obiektów symulacji. Supervisor korzysta z języka Python, co umożliwia użytkownikom łatwe programowanie interakcji między robotami i środowiskiem symulacyjnym. 

Aby odczytać parametry symulacji za pomocą Supervisor-a, możemy użyć następujących instrukcji:

```python
time_step = int(robot.getBasicTimeStep())
```

Jest to przykład instrukcji, która pobiera wartość podstawowego kroku czasowego używanego w symulacji, który może być później wykorzystany dla potrzeb sterowania robotem.

Aby zmienić parametry symulacji, możemy użyć na przykład następującej instrukcji:

```python
robot.setJointTargetPosition(joint_names, joint_positions)
```

Jest to instrukcja, która ustawia pozycję stawów robota na określonych pozycjach. Zamiast "joint_names" należy podać nazwę stawu, a zamiast "joint_positions" - wartość pozycji w radianach. 

Inną przykładową instrukcją może być:

```python
robot_node = supervisor.getFromDef("ROBOT")
translation_field = robot_node.getField("translation")
translation = translation_field.getSFVec3f()
```

Instrukcja ta pobiera pozycję robota (współrzędne x, y, z) i przypisuje ją do zmiennej "translation". 

Zastosowanie Supervisor-a w Webots jest szczególnie przydatne w przypadku chęci personalizowania parametrów symulacji i dodawania nowych funkcjonalności do robotów. Umożliwia to użytkownikom tworzenie bardziej złożonych programów, które wykorzystują dane z symulacji do tworzenia bardziej interaktywnej i realistycznej wirtualnej rzeczywistości.

**Zad. 2 Oblicz, jaka jest ruchliwość manipulatora SCARA.**

Ruchliwość manipulatora SCARA można obliczyć z użyciem równania:

R = 6 - n - m 

gdzie:
R - ruchliwość manipulatora SCARA
n - liczba stopni swobody (niezależnych położeń) w płaszczyźnie roboczej ramienia poziomego
m - liczba stopni swobody w kierunku pionowym (zwykle jeden, dla podnoszenia i opuszczania narzędzia)

Dla typowego manipulatora SCARA, który ma trzy stopnie swobody w płaszczyźnie roboczej ramienia poziomego i jeden stopień swobody w kierunku pionowym, ruchliwość wynosi: 

R = 6 - 3 - 1 = 2 

Oznacza to, że manipulator SCARA może poruszać się w dwóch niezależnych kierunkach w trójwymiarowej przestrzeni roboczej.

# Plik. 15
**Zad. 1 Wyjaśnij pojęcie przekształceń jednorodnych.**

Przekształcenia jednorodne to takie działania matematyczne, które zachowują proporcjonalność między zmiennymi. Oznacza to, że jeśli mnożymy wartości zmiennych przez pewną stałą, to wynik przekształcenia również zostanie pomnożony przez tę samą stałą. 

Formalnie, przekształcenie f nazywamy jednorodnym stopnia k, jeśli dla dowolnego x i dowolnej stałej c zachodzi:

f(cx) = c^k * f(x)

Przykładem przekształcenia jednorodnego jest pierwiastkowanie, ponieważ dla dowolnego x i dowolnej stałej c zachodzi:

sqrt(c * x) = sqrt(c) * sqrt(x)

Innym przykładem są przekształcenia afiniczne, czyli przesunięcia, obroty i skalowania figur geometrycznych. Skalowanie jest przykładem przekształcenia jednorodnego stopnia 2, ponieważ podwojenie długości krawędzi figury skutkuje jej czterokrotnym powiększeniem powierzchni.

**Zad. 2 Oblicz, jaka jest ruchliwość (typowego) manipulatora ramieniowego.**

Ruchliwość manipulatora ramieniowego zależy od liczby stopni swobody (DOF - degrees of freedom), czyli liczby niezależnych kierunków, w których może się poruszać. Typowy manipulator ramieniowy posiada 6 stopni swobody, co oznacza, że może poruszać się w 6 niezależnych kierunkach. 

Ruchliwość ta jest zwykle wykorzystywana do określenia zdolności manipulatora do wykonywania skomplikowanych ruchów i precyzyjnej kontroli pozycji narzędzia. Im większa jest liczba stopni swobody, tym bardziej zaawansowane zadania manipulator może wykonywać. Jednocześnie większa liczba stopni swobody oznacza zwykle większą złożoność mechanizmu i większe koszty budowy i utrzymania.

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie**

Zadanie:

Rozważmy manipulator złożony z jednego łącza obrotowego zamontowanego na bazie. Kąt obrotu łącza wynosi 30 stopni na sekundę. Jakie jest prędkości liniowe i kątowe końca manipulatora znajdującego się w odległości 0.5m od osi obrotu?

Rozwiązanie:

Prędkość kątowa łącza można zapisać jako:

ω = 30°/s = 0.524 rad/s

Prędkość liniowa końca manipulatora można obliczyć jako:

v = ω * r

gdzie r = 0.5m jest odległością końca manipulatora od osi obrotu.

v = 0,524 rad/s * 0,5 m = 0,262 m/s

Prędkość kątowa końca manipulatora jest taka sama jak prędkość kątowa łącza.

ω_konca = ω = 0.524 rad/s

Odpowiedź:

Prędkość liniowa końca manipulatora wynosi 0.262 m/s, a prędkość kątowa końca manipulatora wynosi 0.524 rad/s.

# Plik. 16
**Zad. 1 Wyjaśnij przeznaczenie poszczególnych bitów rejestru STATUS.**

Rejestr STATUS jest rejstrem wewnętrznym procesora, który zawiera informacje o stanie procesora oraz wynikach ostatnio wykonanych operacji.

Poszczególne bity rejestru STATUS pełnią następujące funkcje:

- bit C (Carry) - przeniesienie po wykonaniu operacji arytmetycznej lub logicznej
- bit DC (Digit Carry) - przeniesienie w przypadku operacji na cyfrach dziesiętnych
- bit Z (Zero) - wynik ostatniej operacji był równy zeru
- bit PD (Power Down) - procesor znajduje się w trybie oszczędzania energii
- bit TO (Time-out) - wystąpiło przerwanie zegara wewnętrznego
- bit RP0 (Register Bank Select) - wybór banku rejestrów
- bit IRP (Register Bank Select) - wybór banku rejestrów
- bit n/A (Not Applicable) - niewykorzystywany

Każdy z bitów rejestru STATUS ma swoje unikalne przeznaczenie, które zależy od trybu pracy procesora i wykonywanych operacji. Na podstawie stanu rejestrów można kontrolować przebieg programu i podejmować dalsze decyzje w zależności od wyników operacji.

**Zad. 2 Wykonaj obrót punktu [1,1,1]o30◦dookoła wektora [0.5,0.4,0.3]. Zamieść odpowiednie obliczenia.**

W pierwszej kolejności należy przekształcić wektor [0.5,0.4,0.3] na wektor jednostkowy, dzieląc go przez jego długość:

||[0.5,0.4,0.3]|| = sqrt(0.5^2 + 0.4^2 + 0.3^2) = 0.744

[0.5,0.4,0.3]/0.744 = [0.671,0.536,0.402]

Następnie, korzystając z wzoru na macierz obrotu dla dowolnego kąta i osi, mamy:

|cosθ+(1-cosθ)a_x^2    a_xa_y(1-cosθ)-a_zsinθ  a_xa_z(1-cosθ)+a_ysinθ|
|a_ya_x(1-cosθ)+a_zsinθ cosθ+(1-cosθ)a_y^2    a_ya_z(1-cosθ)-a_xsinθ|
|a_za_x(1-cosθ)-a_ysinθ a_za_y(1-cosθ)+a_xsinθ cosθ+(1-cosθ)a_z^2   |

Dla naszych danych, wartości a_x, a_y, a_z to odpowiednio 0.671, 0.536 i 0.402, a kąt obrotu θ to 30 stopni. Podstawiając te wartości, otrzymujemy:

|0.868  -0.350  0.350 |
|0.350   0.936 -0.002 |
|-0.350  0.002  0.936|

Ostatecznie, wykonując mnożenie macierzowe punktu [1,1,1] przez uzyskaną powyżej macierz obrotu, otrzymujemy:

[0.868,0.650,1.286]

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na**

podstawie obrotowej. Zakładając, że pozioma podstawa obrotowa porusza się z prędkością stałą, a łącze porusza się wzdłuż osi pryzmatu z prędkością proporcjonalną do kąta obrotu podstawy.

Rozwiązanie:

Dla prostoty przyjmujemy, że manipulator porusza się tylko w jednym wymiarze (os X). Oznaczamy przez:

- θ(t): kąt obrotu podstawy w czasie t
- x(t): położenie końca łącza w czasie t
- L: długość łącza

Z treści zadania wynika, że prędkość kątowa podstawy jest stała, czyli:

dθ/dt = const.

Natomiast prędkość liniowa końca łącza jest proporcjonalna do prędkości kątowej podstawy, czyli:

dx/dt = k * dθ/dt

gdzie k jest stałą proporcjonalności.

Zauważamy, że łącze porusza się po linii prostej, więc jego przemieszczenie można opisać za pomocą funkcji liniowej:

x(t) = a * θ(t) + b

gdzie a i b są stałymi do wyznaczenia. Wykorzystując warunek początkowy x(0) = 0, otrzymujemy:

b = 0

Teraz musimy obliczyć wartość stałej a. Do tego celu wykorzystujemy drugi warunek:

dx/dt = k * dθ/dt

Oznaczając pochodną kąta jako ω = dθ/dt, mamy:

a * ω = k * ω

stąd:

a = k

W rezultacie otrzymujemy równanie opisujące położenie końca łącza w czasie t:

x(t) = k * θ(t)

Teraz możemy obliczyć prędkość i przyspieszenie końca łącza. Prędkość to pochodna po czasie:

v(t) = dx/dt = k * dθ/dt = k * ω

Z kolei przyspieszenie to druga pochodna po czasie:

a(t) = dv/dt = k * dω/dt

Aby wyznaczyć dω/dt, musimy skorzystać z faktu, że prędkość kątowa jest stała:

dω/dt = 0

Stąd:

a(t) = 0

Oznacza to, że przyspieszenie końca łącza jest zerowe, czyli ruch jest jednostajny z prędkością v = k * ω.

# Plik. 17
**Zad. 1 Wyjaśnij sposoby adresacji pamięci programu w mikrokontrolerze PIC16f877A.**

Mikrokontroler PIC16f877A ma 13-bitową przestrzeń adresową, co oznacza, że ​​może obsługiwać do 8KB pamięci. Sposoby adresacji pamięci programu w mikrokontrolerze PIC16f877A obejmują:

1. Bezpośrednia adresacja - używa bezpośredniego adresu 8-bitowego, który wskazuje na konkretny bajt pamięci. Na przykład, instrukcja "MOVLW 0x0A" ładuje wartość 0x0A do rejestru W, a instrukcja "MOVWF 0x20" zapisuje wartość w rejestrze W do adresu 0x20 w pamięci.

2. Bezpośrednia adresacja z przesunięciem - używa bezpośredniego adresu 8-bitowego i stałej względnej, która określa przesunięcie od adresu bazowego. Na przykład, instrukcja "MOVLW 0x0A" ładuje wartość 0x0A do rejestru W, a instrukcja "MOVWF 0x20+2" zapisuje wartość w rejestrze W do adresu 0x22 w pamięci (0x20 + 2).

3. Indyrekcyjna adresacja - używa wartości z rejestru, aby wyznaczyć adres pamięci. Na przykład, instrukcja "MOVLW 0x10" ładuje wartość 0x10 do rejestru W, a instrukcja "MOVWF FSR" ustawia FSR na adres 0x10. Następnie instrukcja "MOVWF [FSR]" zapisuje wartość w rejestrze W do adresu wskazywanego przez FSR.

4. Indyrekcyjna adresacja z przesunięciem - używa rejestru i stałej względnej, aby wyznaczyć adres pamięci. Na przykład, instrukcja "MOVLW 0x10" ładuje wartość 0x10 do rejestru W, a instrukcja "MOVWF FSR" ustawia FSR na adres 0x10. Następnie instrukcja "MOVWF [FSR+2]" zapisuje wartość w rejestrze W do adresu 0x12 (0x10 + 2) wskazywanego przez FSR.

5. Adresacja stała - używa bezpośredniej wartości stałej jako adresu pamięci. Na przykład, instrukcja "MOVLW 0x0A" ładuje wartość 0x0A do rejestru W, a instrukcja "GOTO 0x100" przeskakuje do adresu 0x100 w pamięci.

6. Rozszerzona adresacja - używa 21-bitowego adresu do dostępu do większej pamięci. Ta forma adresacji jest dostępna tylko w pewnych trybach pracy i niektórych układach, a nie w standardowym trybie pracy PIC16f877A.

**Zad. 2 Wyjaśnij sposób oprogramowywania wyświetlacza HD44780. Wyjaśnij jakie instrukcje są niezbędne do wyświetlenia**

Tekst na wyświetlaczu HD44780 można programować za pomocą mikrokontrolera lub innego urządzenia. Istnieje kilka metod programowania HD44780, ale poniżej przedstawiono najpopularniejszą.

Chcąc programować wyświetlacz HD44780, najpierw należy skonfigurować porty mikrokontrolera, które będą bezpośrednio połączone z wyświetlaczem. Następnie należy dokładnie zapoznać się z instrukcjami obsługi LCD.

W HD44780 są cztery rejestry:

1. Rejestr instrukcji - umożliwia przesyłanie poleceń do wyświetlacza, takich jak włączenie, wyłączenie wyświetlacza.

2. Rejestr danych - umożliwia przesyłanie danych do wyświetlacza.

3. Rejestr adresowy - kontroluje pozycję kursora.

4. Rejestr trybu pracy - kontorluje tryb pracy wyświetlacza.

Najważniejszymi instrukcjami dla programowania wyświetlacza HD44780 są:

1. Instrukcja ustawienia trybu pracy - "Function set". Dzięki niej kodujemy parametry trybu pracy wyświetlacza, takie jak: liczba wierszy (1 lub 2), wielkość czcionki, interfejs danych (4-bitowy lub 8-bitowy), tryb pracy (zwykły lub rozszerzony).

2. Instrukcja czyszczenia ekranu - "Clear Display". Usuwa cały tekst z wyświetlacza i przenosi kursor na pozycję początkową.

3. Instrukcja ustawienia pozycji kursora - "Set DDRAM Address". Pozwala na ustawienie pozycji kursora na wyświetlaczu.

4. Instrukcja ustawienia kierunku tekstu - "Entry Mode Set". Ustawia kierunek tekstu na wyświetlaczu i sposób przesuwania kursora po wpisaniu kolejnego znaku.

5. Instrukcja wpisywania danych - "Write Data". Wpisuje pojedynczy znak na wyświetlacz.

6. Instrukcja odczytania danych - "Read Data". Pozwala na odczytanie danych z wyświetlacza.

Z uwagi na złożoność procesu programowania, zaleca się korzystać z gotowych bibliotek do obsługi wyświetlacza HD44780. Dostępne są biblioteki dla różnych mikrokontrolerów i języków programowania.

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie i połą-**

czonego z jednym łączem przegubowym.

Aby wyznaczyć parametry DH (Denavit-Hartenberg) dla tego manipulatora, należy przeprowadzić następujące kroki:

1. Wybierz układ odniesienia: W przypadku tego manipulatora należy wybrać bieżący układ odniesienia (B), który znajduje się na bazie.

2. Określ kierunek ruchu poprzecznego: Kierunek ruchu poprzecznego łącza obrotowego (jednostopniowy) jest prostopadły do osi obrotu, zatem kierunek ten jest wyznaczony przez wektor jednostkowy i_hat = [1, 0, 0]^T.

3. Zdefiniuj osie obrotu i układy współrzędnych: W przypadku jednostopniowego łącza obrotowego wystarczy zdefiniować jedną oś obrotu (z), która jest równoległa do osi obrotu łącza. Aby określić układy współrzędnych dla poszczególnych łącz, należy zdefiniować układ współrzędnych związany z poprzednim łączem (lub z układem bazowym w przypadku pierwszego łącza) oraz układ współrzędnych związany z obecnym łączem.

4. Określ punkt wspólny: Ponieważ manipulator składa się tylko z jednego łącza obrotowego i jednego łącza przegubowego, punkt wspólny można zdefiniować jako początek łącza obrotowego (w środku bazy).

5. Określ wartości parametrów DH: Po określeniu osi obrotów i punktu wspólnego oraz zdefiniowaniu układów współrzędnych dla poszczególnych łącz, można wyznaczyć wartości parametrów DH dla każdego łącza:

- a_i: Długość prostopadłej odległości między osią z_{i-1} a z_i wzdłuż osi x_{i-1}.
- alpha_i: Kąt między osią z_{i-1} a z_i wzdłuż osi x_{i-1}.
- d_i: Długość między osią z_{i-1} a z_i wzdłuż osi z_i.
- theta_i: Kąt między osią x_{i-1} a x_i wzdłuż osi z_i.

W przypadku tego manipulatora, parametry DH dla obu łącz wynoszą:

- łącze obrotowe:

  - a_1 = 0
  - alpha_1 = 0
  - d_1 = 0
  - theta_1 = q_1 (zmienna kątowa)

- łącze przegubowe:

  - a_2 = 0
  - alpha_2 = 0
  - d_2 = L (stała długość łącza)
  - theta_2 = q_2 (zmienna kątowa)

gdzie q_1 i q_2 oznaczają kąt obrotu łącz pierwszego i drugiego odpowiednio.

# Plik. 18
**Zad. 1 Wyjaśnij sposoby adresacji pamięci danych w mikrokontrolerze PIC16f877A.**

Mikrokontroler PIC16f877A używa dwóch sposobów adresacji pamięci danych: bezpośredniej i pośredniej.

Adresowanie bezpośrednie polega na bezpośrednim odwołaniu do konkretnego adresu pamięci, w którym znajduje się dane. Adres ten może zostać zdefiniowany w kodzie programu lub pobrany z rejestru. W przypadku PIC16f877A, zakres adresowania bezpośredniego wynosi od 0x00 do 0xFF i odnosi się do rejestrów wewnętrznych, pamięci RAM oraz pamięci EEPROM.

Adresowanie pośrednie jest używane, gdy konkretny adres danych jest nieznany lub wymaga dynamicznego określenia. W takim przypadku, adres danych jest zapisywany w rejestrze specjalnym, wskazującym na kolejny adres, który zawiera właściwe dane. W PIC16f877A adresowanie pośrednie jest realizowane poprzez rejestry WREG, FSR oraz PCLATH.

Rejestr WREG (Working Register) służy do przechowywania wartości tymczasowych lub do realizowania operacji arytmetycznych. W przypadku adresowania pośredniego, wartość adresu pamięci jest zapisywana w rejestrze WREG.

Rejestr FSR (File Select Register) umożliwia wybór jednego z banków rejestrów, w którym znajduje się adres pamięci. Wartość zapisana w rejestrze FSR jest dodawana do wartości z rejestru WREG, tworząc pełen adres pamięci.

Rejestr PCLATH (Program Counter Latch High) służy do przechowywania części wysokiej adresu pamięci programu. W przypadku adresowania pośredniego w pamięci programu, wartość z rejestrów FSR i WREG dodawana jest do wartości PCLATH, aby utworzyć pełny adres.

**Zad. 2 Wyjaśnij sposób działania konwertera analogowo-cyfrowego. Wyjaśnij jakie instrukcje są niezbędne do wykonania**

Konwerter analogowo-cyfrowy (ADC) jest urządzeniem, które przekształca sygnał analogowy na sygnał cyfrowy. Sposób działania konwertera polega na porównywaniu sygnału wejściowego z sygnałem referencyjnym i przekształceniu otrzymanej różnicy na sygnał cyfrowy.

W procesie przekształcania sygnału analogowego na cyfrowy, istotne są trzy etapy:

1. Próbkowanie: polega na pobieraniu próbek sygnału analogowego w ustalonych odstępach czasowych.

2. Kwantowanie: polega na przypisaniu wartości cyfrowej dla każdej pobranej próbki sygnału analogowego.

3. Kodowanie: polega na zapisaniu wartości cyfrowej w konkretnym formacie (np. binarnym).

Aby uruchomić konwerter analogowo-cyfrowy, należy wykonać kilka instrukcji:

1. Wybrać odpowiedni tryb i konfigurację pracy.

2. Ustawić parametry sygnału wejściowego, takie jak zakres pomiarowy, częstotliwość próbkowania, poziom sygnału referencyjnego.

3. Uruchomić konwersję i przekazać pobrane próbki do procesora lub mikrokontrolera.

4. Odczytać wartości cyfrowe i dokonać dalszej obróbki lub analizy sygnału.

Konwertery analogowo-cyfrowe są powszechnie stosowane w systemach pomiarowych, przetwarzaniu sygnałów, regulacji i kontroli procesów przemysłowych oraz w elektronice użytkowej (np. w kamerach cyfrowych, smartfonach, czy tabletach).

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na bazie i**

dwóch osi obrotowych:

1. Długość łącza pryzmatycznego: d1
2. Odległość osi obrotowej pierwszego przegubu od bazy: a1
3. Odległość osi obrotowej drugiego przegubu od końca łącza pryzmatycznego: a2

Wyznaczanie parametrów DH polega na przypisaniu układu współrzędnych do każdego z przegubów robota oraz opracowaniu macierzy transformacji jednego układu do drugiego. Schemat DH dla manipulatora składającego się z trzech przegubów opisuje się następującymi przekształceniami:

1. Piasty – Translacja wzdłuż osi Z (zdjęcia ramienia od korpusu) o d1
2. Główny korpus – Obrót wokół osi Z (pozostaje stałe)
3. (Pierwszy przegub) – Translacja wzdłuż osi X przesunięcie o a1 wzdłuż Z
4. (Drugi przegub) – Translacja wzdłuż osi X przesunięcie o a2 wzdłuż Z.

Definiowanie parametrów DH powinno poprawić wałki obracające się wokół osi oraz przemieszczenia po osiach robota. Dzięki temu będzie możliwe zaprojektowanie trajektorii ruchu robota, które pozwolą na czyszczenie von Neumanna czy programowanie podobnych zadań.

# Plik. 19
**Zad. 1 Przedstaw i opisz elementy pamięci programu mikrokontrolera PIC16f877A.**

Mikrokontroler PIC16f877A posiada następujące elementy pamięci:

1. Pamięć flash - służy do przechowywania programu użytkownika, który jest zapisywany czytelnym kodem asemblera i przechowywany w pamięci flash. Ta pamięć jest nieulotna i pozwala na programowanie mikrokontrolera.

2. Pamięć EEPROM - ta pamięć jest również nieulotna i służy do przechowywania danych, które są zaprogramowane na stałe i nie ulegają zmianie. Płytka rozwojowa mikrokontrolera PIC16f877A ma 256 bajtów pamięci EEPROM.

3. Pamięć RAM - ta pamięć jest ulotna i służy do przechowywania danych podczas działania programu. Pamięć RAM ma pojemność 368 bajtów.

4. Pamięć rejestrowa - mikrokontrolery PIC mają wiele rejestrów, które służą do wykonywania różnych operacji i przechowywania danych tymczasowych.

5. Pamięć programowa - służy do przechowywania specjalnych instrukcji, które pozwalają na kontrolowanie działania mikrokontrolera.

W sumie PIC16f877A oferuje aż 14-bitowe adresowanie, przy jednoczesnym braku stronicowania, co daje dość duży zakres zastosowań i łatwość programowania.

**Zad. 2 Układ jest przedstawiony jak na rysunku, gdzie R1= 50Ω to impedancja układu zasilania, a Rs= 300Ω to**

rezystancja obciążenia.

Nie ma rysunku dołączonego do pytania, więc nie możemy dokładnie ocenić, jak wygląda ten układ. Podstawowe informacje, które podano, to impedancja układu zasilania (R1=50Ω) i rezystancja obciążenia (Rs=300Ω). Mogą one być stosowane do obliczenia wartości prądu i napięcia w układzie, ale konkretny wynik zależy od rodzaju układu i innych elementów składowych.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

y(t) = a * u(t) - b * y(t-1)

gdzie y(t) oznacza wartość wyjściową czujnika w chwili t, u(t) to sygnał wejściowy, a i b to stałe współczynniki charakteryzujące właściwości czujnika. Równanie to opisuje dynamiczne zachowanie czujnika, gdzie jego wyjście zależy nie tylko od sygnału wejściowego w danej chwili, ale także od wyjścia z poprzedniej chwili.

# Plik. 20
**Zad. 1 Przedstaw i opisz podstawowe elementy pamięci mikrokontrolera PIC16f877A.**

Podstawowe elementy pamięci mikrokontrolera PIC16f877A to:

1. Flash - pamięć programu, która przechowuje kod programu. Jest nieulotna i może zostać zaktualizowana przez programowanie.

2. EEPROM - elektrycznie kasowalna i programowalna pamięć tylko do odczytu, która przechowuje dane, takie jak zmienne i stałe. Jest trwale zapisana nawet po odłączeniu zasilania.

3. SRAM - pamięć RAM, która służy jako szybka pamięć robocza dla programu i danych, które aktualnie są używane. Jest ulotna i traci dane po odłączeniu zasilania.

4. Special Function Registers (SFRs) - pamięć specjalna, która przechowuje informacje o konfiguracji i stanu mikrokontrolera, takie jak status flagi, rejestry wejściowe/wyjściowe i liczniki zegarowe.

5. Stos - obszar pamięci, który przechowuje dane stosowane w czasie wykonywania programu, takie jak zmienne lokalne i adresy powrotu z funkcji.

6. Dane programowe - obszar w pamięci flash, który przechowuje dane liczbowe i tekstowe, takie jak stałe i tablice.

7. We/wy porty - służą do komunikacji z urządzeniami zewnętrznymi, takimi jak czujniki, przetworniki i wyświetlacze.

**Zad. 2 Wyjaśnij sposób działania silnika krokowego w trybie z pełnym krokiem i jedną fazą aktywną, oraz w trybie z pełnym**

krokiem i dwoma fazami aktywnymi.

Silnik krokowy to akcyjni element elektryczny, który przekształca sygnały elektryczne na ruch mechaniczny. Silnik krokowy składa się z rdzenia magnetycznego i cewek elektromagnetycznych zamocowanych na jego obwodach. Każda cewka jest podłączona do zewnętrznego układu sterującego, który dostarcza sygnał sterujący.

Tryb z pełnym krokiem i jedną fazą aktywną polega na podawaniu na cewkę elektromagnetyczną kolejno dwóch sygnałów: jednego do zasilania cewki i drugiego do uziemienia cewki. Kiedy cewka jest zasilana, rdzeń magnetyczny powoduje obrót wału silnika krokowego o ustalony kąt (krok). Następnie sygnał do cewki jest odłączany, a druga cewka jest zasilana, co powoduje kolejny krok.

W trybie z pełnym krokiem i dwoma fazami aktywnymi na każdą z cewek jest podawany sygnał sterujący. Prąd przepływający przez cewki zmienia polaryzację magnesów i powoduje obrót wału o ustalony kąt. W trybie tym każdy krok jest rozdzielony na dwa etapy, a precyzja ruchu jest wyższa.

W obu przypadkach ruch silnika jest kontrolowany za pomocą sygnałów sterujących i umożliwia precyzyjne wykonywanie ruchów o ustalonej wielkości kroku. Silniki krokowe wykorzystywane są w urządzeniach mechanicznych, takich jak drukarki, skanery, maszyny do obróbki metali, a także w robotyce i automatyce przemysłowej.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Dany czujnik można opisać za pomocą równania różniczkowego postaci:

\begin{equation}
\frac{d}{dt}y(t) = f(y(t), u(t), t)
\end{equation}

gdzie:

- $y(t)$ to wyjście (odczyt) czujnika w czasie $t$,
- $u(t)$ to wejście (warunki pracy) czujnika w czasie $t$,
- $f(y(t), u(t), t)$ to funkcja opisująca charakterystykę czujnika.

Przykładem funkcji opisującej charakterystykę czujnika może być równanie opisujące zależność między wartością wyjściową czujnika a wartością mierzonej wielkości fizycznej. Dla przykładu, czujnik temperatury może mieć zależność opisaną równaniem:

\begin{equation}
\frac{d}{dt}y(t) = k(T_{wew}(t) - y(t))
\end{equation}

gdzie:

- $k$ to współczynnik proporcjonalności czujnika,
- $T_{wew}(t)$ to temperatura wewnętrzna,
- $y(t)$ to odczyt temperatury dokonany przez czujnik w czasie $t$.

Równanie to mówi nam, że wartość wyjściowa czujnika zależy od różnicy temperatury między jego wnętrzem a otoczeniem oraz od współczynnika proporcjonalności.

# Plik. 21
**Zad. 1 Opisz sposób działania stosu i instrukcje wykorzystywane do jego obsługi w mikrokontrolerach klasy PIC18fxx2 i**

Stos w mikrokontrolerach klasy PIC18Fxx2 jest obsługiwany przez dwa rejestry: SP i WREG.

SP (Stack Pointer) przechowuje adres w pamięci, gdzie znajduje się ostatni zapisany na stosie element. Początkowo SP ustawiany jest na najwyższy adres w pamięci zaalokowanym na stos. Przy dodawaniu nowego elementu na stos SP jest dekrementowany, a przy zdejmowaniu elementu ze stosu SP jest inkrementowany.

WREG (Working Register) to rejestr specjalnego przeznaczenia, który służy do przechowywania wartości tymczasowych w trakcie wykonywania programu. W przypadku stosu, WREG służy do przechowywania wartości, która ma zostać dodana na stos lub pobrana ze stosu.

Instrukcje wykorzystywane do obsługi stosu w mikrokontrolerach klasy PIC18Fxx2 to:

- PUSH: dodaje wartość z rejestru WREG na stos, dekrementuje SP
- POP: pobiera wartość ze stosu i zapisuje ją do rejestru WREG, inkrementuje SP
- CALL: dodaje adres powrotu na stos, dekrementuje SP, skacze do procedury
- RETURN: pobiera adres powrotu ze stosu, inkrementuje SP, wraca do miejsca, z którego zostało wywołane CALL

Dodatkowo, w mikrokontrolerach tej klasy stos wykorzystywany jest również do przechowywania rejestrów kontekstu podczas przerwania, za których obsługę odpowiada reguła LIFO (Last-In-First-Out), czyli ostatni zapisany element jest jako pierwszy pobierany ze stosu. Do obsługi przerwań stosowane są specjalne instrukcje, takie jak:

- PUSHALL: dodaje na stos wszystkie rejestry ogólnego przeznaczenia oraz rejestr statusu
- POPALL: pobiera ze stosu wartości wszystkich rejestrów ogólnego przeznaczenia oraz rejestr statusu

Dzięki stosowi można łatwo przekazywać argumenty i zmienna lokalne między różnymi częściami programu, a także zapisywać i odczytywać adresy powrotu do i z procedur. Stos ma również zastosowanie w obsłudze przerwań, gdzie pozwala na zachowanie kontekstu programu przed jego wykonaniem.

**Zad. 2 Wyjaśnij zjawiska zachodzące w złączu P-N.**

Złącze P-N to złącze pomiędzy półprzewodnikami typu P (ang. positive) i N (ang. negative) o różnych typach (typ P zawiera domieszkę akceptorową, a typ N zawiera domieszkę donorową).

Zjawiska zachodzące w złączu P-N to:

1. Bariera potencjału: W złączu P-N, półprzewodnik typu P i typu N tworzą barierę potencjału, która pozwala na kontrolowanie przepływu prądu przez złącze. Elektrony w półprzewodniku N będą skłaniać się do ruchu w kierunku złącza, a dziura w półprzewodniku P będzie skłaniać się do ruchu w przeciwnym kierunku.

2. Diodowy efekt prostowniczy: Złącza P-N mogą służyć do prostowania prądu w obwodzie elektrycznym. Kiedy anoda diody jest podłączona do złącza typu P, a katoda diody jest podłączona do złącza typu N, prąd może płynąć tylko w jednym kierunku przez złącze, co powoduje, że dioda działa jak prostownik prądu.

3. Efekt pojemnościowy: Złącza P-N są wrażliwe na zmiany napięcia, co powoduje zmianę pojemności złącza w zależności od napięcia na złączu. Pojemność ta wpływa na prąd przepływający przez złącze i może wprowadzać opóźnienia sygnału, co jest istotne w zastosowaniach elektronicznych.

4. Efekt tunelowy: W złączach P-N może wystąpić efekt tunelowy, w którym elektrony są transferowane przez barierę potencjału, co pozwala na przepływ prądu między złączami w kierunku przeciwnym do kierunku normalnego przepływu prądu.

5. Zjawisko rekombinacji: Przy dostatecznie dużym zasilaniu, elektrony i dziury w złączu P-N mogą rekombinować ze sobą, co powoduje generowanie ciepła i zmniejszenie wydajności złącza.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Dla uproszczenia załóżmy, że dany jest czujnik temperatury, oznaczmy jego wyjście przez T(t) [C]. Równanie różniczkowe opisujące jego zachowanie może wyglądać następująco:

dT/dt = q(T, t)

gdzie q(T, t) jest funkcją czasu i temperatury, opisującą sposób, w jaki czujnik reaguje na zmiany temperatury w otoczeniu. Funkcja ta może mieć różne postaci w zależności od rodzaju czujnika i jego konstrukcji.

Rozwiązanie tego równania differentyjnego pozwala określić, jak temperatura na wyjściu czujnika zmienia się w czasie, przy różnych stanach początkowych i warunkach zewnętrznych (np. zmieniająca się temperatura otoczenia). Można też na jego podstawie wyprowadzić parametry charakteryzujące działanie czujnika, takie jak czas reakcji, czułość czy dokładność pomiaru.

# Plik. 22
**Zad. 1 Wyjaśnij znaczenie ﬂag konﬁguracji w mikrokontrolerze PIC16f877A**

Flagi konfiguracji w mikrokontrolerze PIC16f877A służą do ustawiania trybu pracy mikrokontrolera oraz konfiguracji jego peryferiów. Flagi te są przechowywane w specjalnej komórce pamięci o nazwie rejestru konfiguracji. Konfiguracja ta może być ustawiana przez programistę lub automatycznie przez mikrokontroler w zależności od potrzeb.

Przykładowe ustawienia, które można dokonać za pomocą flag konfiguracyjnych to:
- wybór trybu oscylatora (wewnętrznego lub zewnętrznego)
- ustawienia trybu pracy układu taktującego (zegar synchroniczny lub asynchroniczny)
- ustawienia przerwań (włączanie i wyłączanie poszczególnych rodzajów przerwań)
- konfiguracja układów peryferyjnych (np. modułu ADC)

Flagi konfiguracyjne umożliwiają dostosowanie mikrokontrolera do konkretnych wymagań aplikacji. Prawidłowa konfiguracja pozwala na optymalne wykorzystanie zasobów mikrokontrolera oraz zapewnia jego stabilną i bezpieczną pracę.

**Zad. 2 Oblicz, jaka jest ruchliwość manipulatora SCARA.**

Aby obliczyć ruchliwość manipulatora SCARA, należy użyć wzoru:

ruchliwość = liczba stopni swobody - liczba ograniczeń

Liczba stopni swobody to liczba niezależnych ruchów, jakie może wykonywać manipulator. W przypadku manipulatora SCARA są to:

- Ruch pionowy (z)
- Ruch poziomy a (x)
- Ruch poziomy b (y)
- Obrót końcówki (θ)

Liczba ograniczeń to liczba warunków, które muszą być spełnione, aby manipulator mógł się poruszać. W przypadku manipulatora SCARA są to:

- Wiązka postaci ramienia (ramię nie może wyginąć)
- Połączenie między końcówką a punktem, gdzie osie ruchu x i y się przecinają (końcówka nie może się przemieścić wolno w pionie)

W związku z tym ruchliwość manipulatora SCARA to:

ruchliwość = 4 - 2 = 2

Manipulator SCARA ma ruchliwość równą 2.

**Zad. 3 Wyznacz (przybliżoną) liniową charakterystykę wejściowo-wyjściową czujnika, dla którego zebrano doświadczalnie**

Liniowa charakterystyka wejściowo-wyjściowa czujnika to zależność pomiędzy wartością zmierzoną przez czujnik a wartością wyjścia elektrońskiego. Aby wyznaczyć liniową charakterystykę, należy zbadać pomiar dla różnych wartości wejściowych i wyjściowych.

Na przykład, jeśli zmierzono wartości napięcia wejściowego i odpowiadające wartości napięcia wyjściowego czujnika, można przedstawić te wartości na wykresie rozproszenia. Następnie, aby uzyskać charakterystykę liniową, wykonuje się regresję liniową dla punktów i rysuje się prostą, która najlepiej odzwierciedla zależność między wejściem a wyjściem czujnika.

Przykładowo, mając takie pomiary:

Wejście: 1, 2, 3, 4, 5
Wyjście: 2, 4, 6, 8, 10

Możemy przedstawić je na wykresie rozproszenia i wykonać regresję liniową:

Wykres: 

![Wykres_liniowy](https://i.imgur.com/hnTmtEd.png)

Regresja liniowa: 

`y = 2x`

Prosta ta będzie przybliżoną charakterystyką liniową czujnika.

# Plik. 23
**Zad. 1 Czym jest histereza w układach wejściowo-wyjściowych.**

Histereza to stan, w którym wartość wyjściowa układu zależy nie tylko od wartości bieżącej wartości wejściowej, ale także od poprzednich wartości wejściowych. Innymi słowy, układ może reagować na zmiany wartości wejściowej w sposób opóźniony lub skokowy w przypadku, gdy wartość wejściowa wypada poza pewne ustalone granice. W przypadku układów wejściowo-wyjściowych, histereza jest często wykorzystywana w celu uniknięcia falowania wyjściowego lub generowania sygnałów o praktycznym zastosowaniu. Histereza może również wpłynąć na stabilność i dokładność pomiarów w przypadku urządzeń pomiarowych lub regulacyjnych.

**Zad. 2 Oblicz, jaka jest ruchliwość (typowego) manipulatora ramieniowego.**

Nie jest możliwe podanie jednoznacznej wartości ruchliwości manipulatora ramieniowego, ponieważ ruchliwość zależy od wielu czynników, takich jak liczba stopni swobody, długość ramion, kąty ograniczeń ruchu, a także jakość i precyzja silników oraz innych elementów sterujących. Ruchliwość może również różnić się w zależności od trybu pracy robotów (np. szybkie przemieszczanie, precyzyjne pozycjonowanie itp.). Ogólnie rzecz biorąc, manipulatory ramieniowe charakteryzują się wysoką ruchliwością, co umożliwia im dużą elastyczność i wszechstronność w wykonywaniu różnych zadań.

# Plik. 24
**Zad. 1 W jaki sposób zjawisko piezoelektryczne jest wykorzystywane do budowy mikrofonów.**

Mikrofony są urządzeniami, które wykorzystują zjawisko piezoelektryczne do przekształcenia fal dźwiękowych na sygnał elektryczny. Elementem piezoelektrycznym w mikrofonie jest ceramiczny kryształ. Kiedy fale dźwiękowe docierają do mikrofonu, kryształ ulega odkształceniu, co prowadzi do powstania ładunków elektrycznych na jego powierzchniach. 

Te ładunki elektryczne są następnie pobierane przez elektrody mikrofonu, które przetwarzają je na sygnał elektryczny, który może być zarejestrowany przez urządzenia nagrywające. W ten sposób, kryształ piezoelektryczny w mikrofonie służy jako czujnik ruchu, przetwarzając drgania powietrza na sygnał elektryczny, który może być wykorzystany do nagrywania dźwięku. 

Dzięki prostocie i niezawodności, mikrofony piezoelektryczne są powszechnie stosowane w różnych zastosowaniach, od nagrywania muzyki i głosów, aż po kontroli hałasu i detekcji wibracji w przemyśle.

**Zad. 2 Wykonaj obrót punktu [1,1,1]o30◦dookoła wektora [0.5,0.4,0.3]. Zamieść odpowiednie obliczenia.**

Obrotem punktu [1, 1, 1] o $30^\circ$ wokół wektora [0.5, 0.4, 0.3] nazywamy przekształcenie, które polega na znalezieniu punktu [x, y, z], który powstaje przez obrócenie punktu [1, 1, 1] o kąt $30^\circ$ wokół wektora [0.5, 0.4, 0.3], czyli:

[x, y, z] = R([1, 1, 1], [0.5, 0.4, 0.3], $30^\circ$)

Aby obliczyć wynikowe współrzędne, skorzystamy z wzoru:

R([1, 1, 1], [0.5, 0.4, 0.3], $30^\circ$) = 

cos($30^\circ$)([1, 1, 1] - proj[1, 1, 1] na [0.5, 0.4, 0.3]) +

(1 - cos($30^\circ$))[1, 1, 1] +

sin($30^\circ$)[0.5, 0.4, 0.3] x [1, 1, 1]

gdzie proj[1, 1, 1] na [0.5, 0.4, 0.3] oznacza rzut punktu [1, 1, 1] na wektor [0.5, 0.4, 0.3], a x oznacza iloczyn wektorowy.

Obliczmy teraz poszczególne składniki:

- proj[1, 1, 1] na [0.5, 0.4, 0.3] = 

([1, 1, 1] * [0.5, 0.4, 0.3]) / ||[0.5, 0.4, 0.3]||^2 * [0.5, 0.4, 0.3] 

= (1.2 / 0.34) * [0.5, 0.4, 0.3]
 
≈ [2.794, 2.235, 1.676]

- [1, 1, 1] - proj[1, 1, 1] na [0.5, 0.4, 0.3] = [1, 1, 1] - [2.794, 2.235, 1.676] ≈ [-1.794, -1.235, -0.676]

- [0.5, 0.4, 0.3] x [1, 1, 1] = 

[(0.4*1-0.3*1), (-0.5*1+0.3*1), (0.5*1-0.4*1)] 

≈ [-0.1, -0.2, 0.1]

Wstawiając te wartości do wzoru otrzymujemy:

R([1, 1, 1], [0.5, 0.4, 0.3], $30^\circ$) = 

cos($30^\circ$)[-1.794, -1.235, -0.676] +

(1 - cos($30^\circ$))[1, 1, 1] +

sin($30^\circ$)[-0.1, -0.2, 0.1]

= [0.78, 0.56, 1.28]

Ostatecznie, punkt [1, 1, 1] obrócony o $30^\circ$ wokół wektora [0.5, 0.4, 0.3] ma współrzędne [0.78, 0.56, 1.28].

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie**

Zadanie kinematyki dla manipulatora z jednym łączem obrotowym zamontowanym na bazie można rozwiązać przy użyciu podstawowych równań kinematyki.

Niech l będzie długością łącza manipulatora. Niech kąt obrotu łącza w stosunku do bazy będzie oznaczony jako θ.

Możemy wyznaczyć pozycję końca manipulatora (x, y) zgodnie ze wzorami:

x = l * cos(θ)
y = l * sin(θ)

Jeśli znamy pozycję końca manipulatora (x, y), możemy wyznaczyć kąt obrotu łącza θ zgodnie ze wzorami:

θ = atan2(y, x)

gdzie atan2(y, x) to funkcja arcus tangens, która zwraca kąt między osią x a punktem (x, y) na płaszczyźnie.

Rozwiązanie kinematyki dla manipulatora z jednym łączem obrotowym zamontowanym na bazie jest stosunkowo proste, ponieważ manipulator może wykonywać ruch tylko w jednej płaszczyźnie. Jednak w bardziej skomplikowanych manipulatorach z kilkoma łączami i stopniami swobody rozwiązanie kinematyki staje się znacznie bardziej złożone.

# Plik. 25
**Zad. 1 Wyjaśnij sposób działania termopary i łańcucha termicznego.**

Termopary są urządzeniami termometrycznymi składającymi się z dwóch przylegających do siebie przewodów różnego materiału. Kiedy miejsca łączenia tych przewodów są poddane różnicom temperatur, to generuje to siłę elektromotoryczną (SEM). Wynikające z tego napięcie jest proporcjonalne do różnicy temperatur pomiędzy punktami połączenia przewodów.

Łańcuch termiczny natomiast to system, w którym przenoszenie ciepła zachodzi sekwencyjnie. Składa się on z elementów, które są połączone w serii lub równolegle, przy czym przepływ ciepła zachodzi od elementów o wyższej temperaturze do niższej. W łańcuchu termicznym mamy do czynienia z różnymi elementami, takimi jak materiały izolacyjne, przewody elektryczne lub pomiary ciepła oraz urządzenia (np. piece lub chłodnice), które zapewniają transfer energii cieplnej. Pomiędzy elementami mogą występować opory cieplne, które wpływają na przenikanie ciepła w łańcuchu termicznym.

W obu przypadkach kluczowym elementem jest przenoszenie energii, jednak w przypadku termopary energia jest przekazywana w postaci energii elektrycznej, a w łańcuchu termicznym przenoszona jest energia cieplna.

**Zad. 2 Wyjaśnij sposób oprogramowywania wyświetlacza HD44780. Wyjaśnij jakie instrukcje są niezbędne do wyświetlenia**

tekstu na wyświetlaczu HD44780.

HD44780 to popularny sterownik wyświetlacza alfanumerycznego, który jest często stosowany w różnego rodzaju urządzeniach elektronicznych, takich jak zegarki, termometry, czy komputery. Aby sterować wyświetlaczem HD44780, konieczne jest napisanie odpowiedniego programu w języku programowania, takim jak C czy C++. 

Aby wyświetlić tekst na wyświetlaczu HD44780, należy najpierw ustawić tryb pracy wyświetlacza. Można to zrobić za pomocą komendy 0x20, która ustawia tryb pracy na 4-bitowy. Kolejnym krokiem jest ustawienie liczby wierszy i kolumn wyświetlacza za pomocą komendy 0x08. Domyślnie wyświetlacz HD44780 pracuje w trybie 2 wierszy i 16 kolumn, ale można to zmienić, ustawiając odpowiednią wartość w rejestrze.

Następnie należy wyczyścić wyświetlacz za pomocą komendy 0x01, która wyświetla pusty ekran. Kolejnym krokiem jest ustawienie pozycji kursora za pomocą komendy 0x80, która ustawia kursor w górnym lewym rogu wyświetlacza. Kursor jest punktem, w którym będzie wyświetlany kolejny znak.

Aby wyświetlić tekst na wyświetlaczu, należy wysłać kolejne bajty z kodem ASCII każdego znaku, który chcemy wyświetlić. Można to zrobić za pomocą komendy 0x06, która ustawia tryb inkrementacji kursora, lub 0x07, która ustawia tryb dekrementacji kursora, w zależności od preferencji programisty.

Komendy te są niezbędne do wyświetlenia tekstu na wyświetlaczu HD44780, ale istnieją również inne instrukcje, takie jak ustawienie trybu pracy wyświetlacza (domyślnie tekst), ustawienie jasności wyświetlacza, czy ustawienie kierunku przesuwania tekstu. Te dodatkowe instrukcje są pomocne przy tworzeniu bardziej zaawansowanych aplikacji z wykorzystaniem wyświetlacza HD44780.

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na**

osobnej podstawie.

Załóżmy, że manipulator znajduje się w pozycji wyjściowej, czyli składa się z jednego łącza, które jest równoległe do podstawy. Chcemy, aby manipulator przeszedł z pozycji wyjściowej do punktu o współrzędnych (x,y,z).

Zacznijmy od ustalenia położenia ramienia w pozycji wyjściowej. Załóżmy, że długość łącza wynosi L, a kąt między łączem a osią z wynosi 0 stopni. Zdefiniujmy też punkt-mocowanie na podstawie manipulatora jako punkt (0,0,0).

Jeśli chcemy przenieść ramie na punkt o współrzędnych (x,y,z), musimy określić odpowiedni kąt między łączem a osią z. Możemy to zrobić korzystając z trygonometrii.

Zgodnie z własnościami trójkąta prostokątnego, możemy wyznaczyć kąt między osią z a połączeniem punktu (x,y,z) z punktem-mocowaniem. Aby to zrobić, musimy wyznaczyć długości boków trójkąta.

Długość boku przyległego do kąta wynosi y, a bok przeciwległy wynosi sqrt(x^2 + z^2). Ostatecznie kąt między osią z a połączeniem punktu (x,y,z) z punktem-mocowaniem wynosi:

theta = arctan(y/sqrt(x^2 + z^2))

Gotowe! Teraz możemy obrócić łącze o wyliczony kąt, aby przenieść manipulator do wybranego punktu.

# Plik. 26
**Zad. 1 Wyjaśnij sposób działania kamery CCD.**

Kamera CCD (Charge-Coupled Device) działa w oparciu o zjawisko fotoelektryczne, które polega na tym, że foton (cząstka światła) uderzając w materię wybija z niej elektron. 

W kamerze CCD znajduje się płytka krzemowa pokryta małymi pikselami, na których padają fotony. Piksele te tworzą macierz, która składa się z tysięcy wertykalnych i horyzontalnych rzędów pikseli. Każdy piksel zawiera warstwę półprzewodnika, która reaguje na fotony i wybija z niej elektrony. 

Następnie elektrony są przesuwane przez tzw. układ CCD (ang. charge-coupled device), czyli matrycę elektrod, które tworzą elektryczne pola. Pole te przesuwają elektrony z jednego piksela do drugiego, zgodnie z zaprogramowanym skanowaniem obrazu. 

Kiedy elektrony przemieszczają się przez układ CCD, są one przetwarzane na sygnał elektryczny, który odpowiada natężeniu światła, jakie padło na piksel. Sygnały te są konwertowane na wynikowy obraz, który wyświetla się na ekranie monitora lub zapisuje na nośniku danych. 

W wyniku działania kamery CCD obraz jest generowany bardzo szybko – generowanie jednego klatki trwa zaledwie ułamki sekundy – co czyni ją idealną do zastosowań wideo i fotograficznych.

**Zad. 2 Wyjaśnij sposób działania konwertera analogowo-cyfrowego. Wyjaśnij jakie instrukcje są niezbędne do wykonania**

Konwerter analogowo-cyfrowy (ADC) to urządzenie, które przekształca sygnały analogowe na sygnały cyfrowe. Zadaniem konwertera jest próbkowanie i kwantyzacja sygnału analogowego. 

Proces próbkowania polega na pobieraniu wartości sygnału w określonych momentach czasowych, co pozwala na utworzenie ciągłego sygnału próbkowanego. Następnie sygnał jest poddawany kwantyzacji, co oznacza, że wartości sygnału są zamieniane na konkretne wartości cyfrowe. 

Konwerter ADC składa się z dwóch głównych elementów: 
- bloku próbkowania i przechowywania wartości próbek sygnału 
- bloku kwantyzacji, który zamienia wartości sygnału na wartości cyfrowe.

Aby wykonać konwersję, konwerter ADC wymaga sygnału analogowego do przekształcenia, czasu próbkowania, rozdzielczości, tzn. liczby bitów wyniku konwersji, i rozmiaru bufora pamięci dla przechowywania próbek sygnału.

Instrukcje potrzebne do wykonania konwersji to przede wszystkim ustawienie parametrów konwertera, takich jak rozdzielczość i czas próbkowania, a następnie uruchomienie konwersji za pomocą odpowiedniej funkcji lub instrukcji. Po zakończeniu konwersji należy odczytać wynik konwersji z wewnętrznego rejestru konwertera ADC.

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie i połą-**

czonego z elementem końcowym za pomocą przegubu obrotowego.

Aby wyznaczyć parametry DH, musimy najpierw zdefiniować 4 ramiona łączące przeguby, wraz z układem ich osi:

1. Ramie bazy: osia z obrotu bazy do obrotu ramienia.
2. Ramie łączące: osia z obrotu ramienia do obrotu przegubu.
3. Ramie przegubu: osia z obrotu przegubu do obrotu końcówki.
4. Ramie końcówki: osia z obrotu końcówki do punktu docelowego.

Kolejnym krokiem jest przypisanie stałych długości, kątów i współrzędnych dla każdej osi. 

1. Ramie bazy:
- długość: 0
- kąt: $\theta_1$
- współrzędna: $(0, 0, 0)$

2. Ramie łączące:
- długość: $a_1$
- kąt: 0
- współrzędna: $(0, 0, 0)$

3. Ramie przegubu:
- długość: $d_2$
- kąt: $\theta_2$
- współrzędna: $(a_1, 0, 0)$

4. Ramie końcówki:
- długość: $d_3$
- kąt: 0
- współrzędna: $(a_1, 0, -d_2)$

Następnie, wyznaczamy macierze transformacji dla każdego przegubu, które służą do przeliczenia współrzędnych z jednego układu do drugiego. 

Transformacja pierwszego przegubu (ramie bazy do łączącego):
$$
a = 0, \quad\alpha = 0,\quad d = 0, \quad \theta = \theta_1
$$
$$
A_1 = \begin{bmatrix}
\cos\theta_1 & -\sin\theta_1 & 0 & 0\\
\sin\theta_1 & \cos\theta_1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1 \\
\end{bmatrix}
$$

Transformacja drugiego przegubu (ramie łączące do przegubu):
$$
a = a_1, \quad\alpha = 0,\quad d = 0, \quad \theta = 0
$$
$$
A_2 = \begin{bmatrix}
1 & 0 & 0 & a_1\\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1 \\
\end{bmatrix}
$$

Transformacja trzeciego przegubu (przegub do końcówki):
$$
a = 0, \quad\alpha = -\frac{\pi}{2},\quad d = d_2, \quad \theta = \theta_2
$$
$$
A_3 = \begin{bmatrix}
\cos\theta_2 & -\sin\theta_2 & 0 & 0\\
\sin\theta_2 & \cos\theta_2 & 0 & 0 \\
0 & 0 & 1 & d_2 \\
0 & 0 & 0 & 1 \\
\end{bmatrix}
$$

Transformacja czwartego przegubu (końcówka do punktu docelowego):
$$
a = 0, \quad\alpha = 0,\quad d = d_3, \quad \theta = 0
$$
$$
A_4 = \begin{bmatrix}
1 & 0 & 0 & 0\\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & -d_3 \\
0 & 0 & 0 & 1 \\
\end{bmatrix}
$$

Ostatecznie, wyznaczamy macierz przejścia od układu bazowego do układu końcowego, łącząc macierze transformacji:
$$
T = A_1 A_2 A_3 A_4
$$

Mając macierz T, możemy wyznaczyć położenie końcówki w stosunku do bazy, korzystając z ostatniej kolumny T:
$$
\begin{bmatrix}
x \\
y \\
z \\
1 \\
\end{bmatrix}
= T \begin{bmatrix}
0 \\
0 \\
0 \\
1 \\
\end{bmatrix}
$$

Gotowe parametry DH to:
- $a_1$: odległość między osią obrotu bazy a osią obrotu ramienia
- $d_2$: odległość między osią obrotu przegubu a osią obrotu końcówki
- $d_3$: odległość między obrotem końcówki a punktem docelowym
- $\theta_1$: kąt obrotu bazy
- $\theta_2$: kąt obrotu przegubu
- $\alpha_1 = \alpha_2 = 0$, ponieważ oba przeguby są obrotowe.

# Plik. 27
**Zad. 1 Wyjaśnij sposób działania konwertera analogowo-cyfrowego. Zamieść niezbędne obliczenia.**

Konwerter analogowo-cyfrowy (ADC) to urządzenie elektroniczne, które konwertuje sygnał analogowy na sygnał cyfrowy. Sposób jego działania opiera się na próbkowaniu i kwantowaniu sygnału.

Próbkowanie polega na pobieraniu próbek sygnału wejściowego w regularnych odstępach czasowych. Odstęp między próbkami określany jest przez częstotliwość próbkowania, wyrażoną w hertzach (Hz). Im wyższa częstotliwość próbkowania, tym większa dokładność i wierność rekonstrukcji sygnału.

Kwantowanie polega na przypisywaniu każdej pobranej próbce wartości binarnej, czyli w systemie dwójkowym. W wyniku tego procesu sygnał analogowy zostaje zastąpiony ciągiem wartości binarnych, które reprezentują wartości sygnału w poszczególnych chwilach czasu.

Obliczenia, jakie należy wykonać w konwerterze analogowo-cyfrowym, związane są z procesem kwantowania, a dokładniej z wyznaczaniem poziomu sygnału. Wartość binarna opisująca próbkę sygnału jest uzyskiwana przez porównanie jej z określonym poziomem progowym. Jeżeli wartość sygnału jest większa niż próg, to wynikiem kwantowania jest wartość binarna 1, a jeśli wartość sygnału jest mniejsza lub równa niż próg, to wynikiem kwantowania jest wartość binarna 0.

Wzór na wyznaczanie wartości sygnału cyfrowego w zależności od wartości analogowej i prógów kwantyzacji wygląda następująco:

Vout = Q * [(Vana - Vmin) / (Vmax - Vmin)]

gdzie:
- Vout to wartość sygnału cyfrowego
- Q to liczba poziomów kwantyzacji, określana przez liczbę bitów użytych w procesie kwantowania
- Vana to wartość sygnału analogowego
- Vmin to minimalna wartość sygnału analogowego
- Vmax to maksymalna wartość sygnału analogowego.

Wartość Vout wyrażona jest binarnie i opisuje wartość sygnału w danym czasie. Cały proces odbywa się bardzo szybko, w zależności od częstotliwości próbkowania, umożliwiając szybką i precyzyjną cyfrową analizę sygnału analogowego.

**Zad. 2 Układ jest przedstawiony jak na rysunku, gdzie R1= 50Ω to impedancja układu zasilania, a Rs= 300Ω to**

impedancja źródła sygnału.

![układ](https://i.imgur.com/WTriNof.png)

Aby obliczyć impedancję zastępczą układu, należy skorzystać z równania:

Z = R1 + Rs

Z = 50Ω + 300Ω

Z = 350Ω

Impedancja zastępcza układu wynosi 350Ω.

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na bazie i**

z jednym przegubem obrotowym łączącym to łącze z narzędziem końcowym.

Parametry DH dla takiego manipulatora to:

1. Długość łącza pryzmatycznego: a1
2. Kąt obrotu pierwszego przegubu: θ1
3. Odległość między osiami obrotu pierwszego i drugiego przegubu: d2
4. Długość narzędzia końcowego: d4

Zgodnie z konwencją DH, przyjmujemy następujące ustalenia:

- Osie z-0 i x-1 pokrywają się.
- Osie x-0 i x-1 nachylone są do siebie o kąt α1, mierzący od osi x-0 do osi x-1 w kierunku przeciwnym do ruchu wskazówek zegara.
- Osie z-1 i z-2 pokrywają się.
- Osie x-1 i x-2 nachylone są do siebie o kąt α2, mierzący od osi x-1 do osi x-2 w kierunku przeciwnym do ruchu wskazówek zegara.

Wzory na parametry DH wyglądają następująco:

a1 = d2 = 0 (bo mamy tylko jedno łącze)
θ1 = q1 (kąt obrotu pierwszego przegubu równy kątowi sterującemu q1)
d4 = 0 (bo narzędzie końcowe jest zamocowane bezpośrednio do drugiego przegubu)

Tabela parametrów DH wygląda tak:

| i | αi-1 | ai-1 | di   | θi   |
|---|------|------|------|------|
| 1 | 0    | a1   | 0    | θ1   |
| 2 | 0    | 0    | d2   | 0    |
| 3 | 0    | 0    | 0    | 0    |
| 4 | 0    | 0    | d4   | 0    |

Ostatecznie, macierz transformacji homogenicznej z bazy do narzędzia końcowego wygląda tak:

T0_4 = T0_1 * T1_2 * T2_3 * T3_4

gdzie T0_1, T1_2, T2_3 i T3_4 to macierze transformacji homogenicznej między kolejnymi połączeniami w manipulatorze, a T0_4 to macierz transformacji homogenicznej z bazy do narzędzia końcowego.

# Plik. 28
**Zad. 1 Wyjaśnij sposób działania konwertera cyfrowo-analogowego. Zamieść niezbędne obliczenia.**

Konwerter cyfrowo-analogowy (DAC) to układ elektroniczny, który przetwarza sygnał cyfrowy na sygnał analogowy. DAC konwertuje ciągły sygnał binarny na odpowiadający mu sygnał napięciowy lub prądowy, który może być odczytywany przez dalsze urządzenia.

Proces przetwarzania sygnału cyfrowego na analogowy w DAC polega na podstawieniu wartości liczby binarnej do wzoru na wartość napięcia lub prądu. Wzór ten może być różny w zależności od typu DAC, jednak w większości przypadków wykorzystuje się wzór liniowy:

Vout = (Vref * D) / 2^n

gdzie:
- Vout - napięcie analogowe wyjściowe DAC
- Vref - wartość napięcia odniesienia, np. 2.5V
- D - wartość cyfrowa wejściowa sygnału, od 0 do 2^n-1, gdzie n to liczba bitów DAC
- n - liczba bitów DAC

Podstawiając konkretne liczby, przykładowo dla 8-bitowego DAC i wartości napięcia odniesienia Vref = 2.5V, otrzymujemy:

Vout = (2.5V * D) / 2^8

W takim przypadku wartość napięcia analogowego wyjściowego będzie się zmieniać od 0V do 2.5V z krokiem 9.77 mV, gdy wartość D zwiększa się od 0 do 255.

W skrócie, DAC konwertuje wartości cyfrowe na odpowiadające im wartości analogowe według określonego wzoru.

**Zad. 2 Wyjaśnij sposób działania silnika krokowego w trybie z pełnym krokiem i jedną fazą aktywną, oraz w trybie z pełnym**

krokiem i dwiema fazami aktywnymi.

Silnik krokowy to rodzaj silnika elektrycznego, który obraca się o stały, określony kąt za każdym razem, gdy do niego podajemy impuls elektryczny. Silnik krokowy może działać w różnych trybach, w tym trybie z pełnym krokiem i jedną fazą aktywną oraz w trybie z pełnym krokiem i dwiema fazami aktywnymi. 

W trybie z pełnym krokiem i jedną fazą aktywną, silnik krokowy jest zasilany jednym impulsowym sygnałem elektrycznym w jednej z jego faz, a pozostałe trzy fazy są pozostawione w stanie martwym. Po zastosowaniu sygnału elektrycznego, silnik krokowy obraca się o jeden pełny krok (ang. full step) w jednym kierunku, a następnie traci moment obrotowy, aż do momentu przesłania kolejnego impulsu elektrycznego. Ten tryb jest najprostszym i najszybszym sposobem na kontrolowanie silnika krokowego, ale ma niską precyzję i gorszą skuteczność energetyczną.

W trybie z pełnym krokiem i dwiema fazami aktywnymi, silnik krokowy jest zasilany dwoma sygnałami elektrycznymi, które zmieniają się na przemian, aktywując kolejno dwie fazy silnika krokowego. Po podaniu pierwszego sygnału, silnik obraca się o połowę kroku (ang. half step) w jednym kierunku, natomiast po podaniu drugiego sygnału silnik obraca się o kolejną połowę kroku w przeciwnym kierunku. Ten tryb zapewnia większą precyzję i bardziej płynny ruch, ale wymaga zastosowania bardziej skomplikowanego algorytmu sterowania, co może zwiększyć koszty i złożoność projektu.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

$$\frac{d}{dt}y(t) = f(u(t),y(t))$$
gdzie:
- $y(t)$ - wartość mierzonej wielkości w czasie $t$
- $u(t)$ - wartość zmiennej wpływającej na czujnik w czasie $t$
- $f$ - funkcja opisująca zależność pomiędzy $u(t)$ i $y(t)$.

Czujnik może mieć różne typy reakcji na zmiany $u(t)$, na przykład:
- Jeśli czujnik ciepła rejestruje wzrost temperatury, to $f$ będzie zależało od różnicy temperatury między czujnikiem a otoczeniem.
- Czujnik wilgotności może mieć bardziej skomplikowaną reakcję, zależną od temperatury, ciśnienia i ilości wilgoci w powietrzu.
- Czujnik ciśnienia może działać na zasadzie zamkniętego systemu hydraulicznego, gdzie $u(t)$ wpływa na ciśnienie w układzie, a $f$ jest związane z właściwościami cieczy lub gazu wewnątrz czujnika.

Czujniki opisane równaniem różniczkowym są często stosowane w systemach regulacji i automatyce, gdzie ich reakcja na sygnały zewnętrzne jest kluczowa dla utrzymania stabilnego działania systemu.

# Plik. 29
**Zad. 1 Wyjaśnij zastosowanie Supervisor-a w oprogramowaniu Webots. Pokaż jak i jakie instrukcje służą do odczytywania**

i modyfikowania parametrów robota.

Supervisor w oprogramowaniu Webots to narzędzie, które umożliwia użytkownikowi kontrolowanie symulacji i interakcję z robotami. Dzięki temu narzędziu użytkownik może modyfikować ustawienia symulacji i parametry robota w czasie jej trwania.

Aby odczytać lub zmodyfikować parametry robota w Webotsie, należy użyć Specyfikacji Dynamicznej Robota (Robot Dynamic Specification). Służy do tego klasa Robot (Supervisor), która reprezentuje robota w symulacji. Aby uzyskać dostęp do specyfikacji danego robota, należy wywołać metodę getRobot() na obiekcie Supervisor.

Przykładowy kod służący do odczytania pozycji robota (np. jego współrzędnych x, y, z) wygląda następująco:

```python
from controller import Robot

# Inicjowanie robota
robot = Robot()

# Pobranie pozycji robota
position = robot.getFromDef("myRobot").getPosition()

# Wyświetlenie pozycji
print("Pozycja robota: ", position)
```

Natomiast przykładowy kod służący do zmiany prędkości robota wygląda następująco:

```python
from controller import Robot

# Inicjowanie robota
robot = Robot()

# Pobieranie kanału prędkości silnika
leftMotor = robot.getDevice("left wheel motor")
rightMotor = robot.getDevice("right wheel motor")

# Ustawienie prędkości robota
leftMotor.setVelocity(10)
rightMotor.setVelocity(10)
```

W powyższym kodzie pobierane są kanały prędkości silników lewego i prawego koła, a następnie ustawiana jest prędkość obrotowa obu kół na poziomie 10 rad/s.

**Zad. 2 Wyjaśnij zjawiska zachodzące w złączu P-N.**

Złącze P-N to połączenie dwóch typów półprzewodników: półprzewodnika typu P, w którym dominują nośniki dziur, oraz półprzewodnika typu N, w którym dominują nośniki elektronowe. W wyniku połączenia tych dwóch półprzewodników powstaje złącze, w którym dochodzi do zjawisk elektrycznych.

Główne zjawiska zachodzące w złączu P-N to:

1. Zjawisko dyfuzyjne - wynika z gradientu stężeń nośników na granicy złącza. Nośniki mniejszej koncentracji dyfundują z obszaru o większej koncentracji do obszaru o mniejszej stężeniu. Nośniki elektronowe dyfundują z obszaru typu N do obszaru typu P, natomiast nośniki dziur dyfundują z obszaru typu P do obszaru typu N.

2. Zjawisko rekombinacji - co do zasady możliwa jest rekombinacja zarówno nośników elektronowych, jak i dziurowych. W wyniku rekombinacji każda para nośników zostaje zneutralizowana, a energia elektronów i dziur uwalnia się w postaci fotonów.

3. Zjawisko tworzenia pola elektrostatycznego - na granicy P-N pojawia się pole elektrostatyczne, które wynika z różnicy potencjałów między obszarem o przewadze nośników typu P a obszarem o przewadze nośników typu N.

4. Zjawisko przebicia - jeśli przyłożymy do złącza zewnętrzne napięcie zbyt duże, to dochodzi do przebicia złącza, co oznacza, że prąd zaczyna płynąć bez kontroli przez złącze. W przypadku przebicia złącza może dojść do uszkodzenia układu elektronicznego.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

:

$\frac{dy}{dt}=-ky$

gdzie $y$ oznacza wartość czujnika w czasie $t$, a $k$ to stała proporcjonalności.

Równanie to opisuje prosty model zaniku sygnału czujnika w czasie. Im większa wartość $k$, tym szybciej następuje zanik sygnału. Rozwiązaniem tego równania jest:

$y(t)=y_0e^{-kt}$

gdzie $y_0$ to początkowa wartość czujnika.

Przykładowo, jeśli $y_0=10$ i $k=0,1$, to po upływie jednej minuty wartość czujnika spadnie do około 6,7. Po dziesięciu minutach będzie ona już tylko około 0,004.

# Plik. 30
**Zad. 1 Wyjaśnij pojęcie przekształceń jednorodnych.**

Przekształcenia jednorodne to takie przekształcenia geometryczne, które zachowują proporcje i proporcjonalność między elementami. Innymi słowy, jeśli przekształcenie jednorodne zmienia długość jednej linii, to zmienia ono również długość pozostałych linii w proporcjonalny sposób. Przykładem przekształcenia jednorodnego jest homotetia, czyli przekształcenie polegające na zmianie skali każdego punktu względem pewnego punktu, tak aby zachować proporcje. Innymi przykładami są przesunięcie, obrót i odbicie lustrzane. Przekształcenia jednorodne są ważne w matematyce, a także w fizyce, gdzie opisują zachowanie się obiektów w różnych skalach.

**Zad. 2 Oblicz, jaka jest ruchliwość manipulatora SCARA.**

Ruchliwość manipulatora SCARA można obliczyć za pomocą równania:

ruchliwość = liczba stopni swobody - liczba ograniczeń

SCARA ma 4 stopnie swobody, co oznacza, że ​​ma możliwość przemieszczania się w czterech niezależnych kierunkach. Ponadto, manipulator SCARA ma pewne ograniczenia w pewnych obszarach, takie jak kąt nachylenia ramienia i ograniczenia ruchu osi obrotowych.

Ostatecznie, ruchliwość manipulatora SCARA wynosi 4 - 2 = 2.

Jest to spowodowane ograniczeniem przesuwu wzdłuż osi Z (pionowej) i obracającym ruchu ramienia manipulatora wokół osi X (poziomej).

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Dany jest czujnik opisany równaniem różniczkowym:

dy/dt + 2y = 5u

Gdzie y oznacza wyjście czujnika (np. napięcie wyjściowe), u oznacza wejście czujnika (np. wartość mierzonej wielkości) a t czas.

Równanie to opisuje reakcję czujnika na zmiany wartości mierzonej wielkości. Im większa wartość wejścia (u), tym większe wyjście (y). Jednocześnie, czujnik reaguje z opóźnieniem (z opóźnieniem równym 2/k, gdzie k to stała czasowa czujnika), co wynika z występowania pierwszej pochodnej w równaniu różniczkowym.

Równanie to można rozwiązać, aby uzyskać funkcję opisującą wyjście czujnika w czasie. W praktyce, czujnik taki może być wykorzystywany np. do pomiaru temperatury, wilgotności lub ciśnienia.

# Plik. 31
**Zad. 1 Wyjaśnij przeznaczenie poszczególnych bitów rejestru STATUS.**

Rejestr STATUS jest rejestrem flagowym, który informuje o różnych warunkach w trakcie działania procesora. Poszczególne bity mają następujące przeznaczenie:

- Bit 0 (C) - carry flag, informuje o wystąpieniu przeniesienia lub pożyczki podczas operacji arytmetycznych.
- Bit 1 (DC) - digit carry flag, informuje o wystąpieniu przeniesienia lub pożyczki w części niższej czterech bitów podczas operacji arytmetycznych.
- Bit 2 (Z) - zero flag, informuje o wystąpieniu wartości zero w wyniku operacji.
- Bit 3 (PD) - power-down flag, informuje o trybie oszczędzania energii związanym z wyłączeniem procesora/rejestru RAm.
- Bit 4 (TO) - timeout flag, informuje o przekroczeniu czasu wykonania danej operacji.
- Bit 5 (R) - reserved, nieużywany bit.
- Bit 6 (I) - interrupt flag, informuje o zezwoleniu (I = 1)/zablokowaniu (I = 0) na obsługę przerwań.
- Bit 7 (N) - negative flag, informuje o wyniku operacji o ujemnej wartości.

**Zad. 2 Oblicz, jaka jest ruchliwość (typowego) manipulatora ramieniowego.**

Ruchliwość manipulatora ramieniowego zależy od liczby stopni swobody, czyli liczby niezależnych ruchów, jakie może wykonywać. 

Typowy manipulator ramieniowy ma 6 stopni swobody, co oznacza, że może wykonywać sześć niezależnych ruchów, takich jak obrót wokół osi, przesunięcie wzdłuż osi, ruch w góre i w dół, itp.

Dlatego ruchliwość typowego manipulatora ramieniowego wynosi 6.

**Zad. 3 Wyznacz (przybliżoną) liniową charakterystykę wejściowo-wyjściową czujnika, dla którego zebrano doświadczalnie**

niepewności pomiarowej. Bez innych danych nie jest możliwe wyznaczenie charakterystyki wejściowo-wyjściowej czujnika. Potrzebne są przynajmniej wartości mierzonych wielkości oraz ich związki ze sobą, aby móc dokonać analizy i wyznaczyć charakterystykę.

# Plik. 32
**Zad. 1 Wyjaśnij sposoby adresacji pamięci programu w mikrokontrolerze PIC16f877A.**

W mikrokontrolerze PIC16f877A dostępne są różne sposoby adresacji pamięci, w tym:

1. Adresowanie bezpośrednie – odwołanie do konkretnego adresu pamięci, np. MOVF 0x20, W oznacza przesłanie zawartości rejestru na pozycji pamięci 0x20 do rejestru W.

2. Adresowanie przez rejestr poczwórny – używany do odwoływania się do pozycji pamięci odpowiadającej wartości przechowywanej w czterech rejestrach, np. MOVF FSR, W oznacza przesłanie zawartości pozycji w pamięci, na którą wskazuje rejestr FSR, do rejestru W.

3. Adresowanie przez rejestr na podstawie offsetu – odwołanie do adresu pamięci z użyciem adresu bazowego i offsetu, np. MOVLW 0x02, ADDWF PORTB, F oznacza dodanie wartości 2 do zawartości rejestru PORTB.

4. Adresowanie przez rejestr ze znacznikiem – używane głównie w przypadku odwoływania się do pozycji pamięci tablicowej, np. MOVF TABLAT, W oznacza przesłanie zawartości pozycji w tablicy do rejestru W.

5. Adresowanie bezpośrednie z indeksem – odwołanie do konkretnego adresu pamięci z wykorzystaniem indeksu, np. MOVF 0x20+INDF, W oznacza przesłanie zawartości adresu pamięci wskazywanego przez zawartość rejestru INDF o wartości 0x20 do rejestru W.

6. Adresowanie przez rejestr indirekcyjny – odwołanie do adresu pamięci wskazywanego przez zawartość rejestru, np. MOVF INDF, W oznacza przesłanie zawartości adresu pamięci wskazywanego przez rejestr INDF do rejestru W.

**Zad. 2 Wykonaj obrót punktu [1,1,1]o30◦dookoła wektora [0.5,0.4,0.3]. Zamieść odpowiednie obliczenia.**

W celu wykonania obrót punktu o kąt 30◦ wokół wektora [0.5,0.4,0.3] możemy skorzystać z formuł Rodriguesa:

r' = r cos(θ) + (k x r) sin(θ) + k(k · r)(1 - cos(θ))

gdzie:
r - punkt poddawany obrotowi [1,1,1]
θ - kąt obrotu (30◦ w radianach = π/6)
k - wektor normalny do płaszczyzny obrotu, czyli [0.5,0.4,0.3]/√(0.5²+0.4²+0.3²) = [0.576,0.461,0.691]

Teraz podstawiając wartości do wzoru otrzymujemy:

r' = [1,1,1] cos(π/6) + ([0.576,0.461,0.691] x [1,1,1]) sin(π/6) + [0.576,0.461,0.691]([0.576,0.461,0.691] · [1,1,1])(1 - cos(π/6))

r' = [1,1,1] √3/2 + [0.154,-0.336,0.214] √3/2 + [0.235,0.188,0.281] 1/2

r' = [1.212,0.775,1.259]

Odpowiedź: obrócony punkt ma współrzędne [1.212,0.775,1.259].

# Plik. 33
**Zad. 1 Wyjaśnij sposoby adresacji pamięci danych w mikrokontrolerze PIC16f877A.**

Mikrokontroler PIC16f877A ma architekturę von Neumanna, co oznacza, że zarówno dane, jak i instrukcje przechowywane są w jednej pamięci. W związku z tym adresowanie pamięci danych odbywa się za pomocą tych samych adresów, co adresowanie instrukcji.

Sposoby adresacji pamięci danych w mikrokontrolerze PIC16f877A to:

1. Adresowanie bezpośrednie - polega na bezpośrednim określeniu adresu komórki pamięci danych, do której chcemy się odwołać. Adres ten zapisywany jest bezpośrednio po instrukcji, np. MOVF 0x20, w której 0x20 to adres komórki pamięci.

2. Adresowanie pośrednie - wykorzystuje rejestr wskaźnikowy (ang. pointer) do przechowywania adresu danej komórki pamięci. Rejestr ten może przyjąć wartość z dowolnej innej komórki pamięci, co umożliwia adresowanie danych, których adresy nie są znane na etapie pisania programu. Przykładem instrukcji z takim sposobem adresacji jest MOVF FSR, w której FSR to rejestr wskaźnikowy.

3. Adresowanie przez stronę - polega na określeniu adresu pamięci na podstawie wartości znajdującej się w rejestrze STATUS. Adres ten zawsze startuje od adresu początkowego danej strony pamięci. Przykładem instrukcji z takim sposobem adresacji jest MOVF 0x05, 0x00, w której 0x05 to numer strony pamięci.

4. Adresowanie bezpośrednie z przesunięciem - umożliwia adresowanie danych w sposób względny do adresu bazowego. Adres przesunięcia jest określany bezpośrednio po instrukcji, a wartość przesunięcia jest przechowywana w jednym z rejestrów wewnętrznych mikrokontrolera. Przykładem instrukcji z tym sposobem adresacji jest MOVF 0x20, ACCESS, w której ACCESS oznacza adresowanie względne.

5. Adresowanie pośrednie z przesunięciem - połączenie adresowania pośredniego z przesunięciem. Polega na określeniu adresu pamięci przez zsumowanie wartości przechowywanej w rejestrze wskaźnikowym i wartości przesunięcia przechowywanej w jednym z rejestrów wewnętrznych. Przykładem instrukcji z tym sposobem adresacji jest MOVF INDF, 0x01, w której INDF to rejestr wskaźnikowy, a 0x01 to wartość przesunięcia.

**Zad. 2 Wyjaśnij sposób oprogramowywania wyświetlacza HD44780. Wyjaśnij jakie instrukcje są niezbędne do wyświetlenia**

Tekstu na wyświetlaczu HD44780 można programować za pomocą mikrokontrolera lub mikroprocesora. Do połączenia z wyświetlaczem wystarczy zwykle kilka przewodów przy użyciu interfejsu szeregowego, takiego jak interfejs I2C lub SPI.

Każdy wyświetlacz HD44780 jest podzielony na 80 pikseli składających się z 5x8 punktów. Są one niezależne, ponieważ mają własne kontrolery, więc można wyświetlić różne znaki lub komunikaty na różnych pozycjach na ekranie.

Najważniejsze instrukcje programowania wyświetlacza HD44780 to:
- Włącz wyświetlacz: 0x0E lub 0x0C
- Ustaw tryb kursora: 0x06 lub 0x04
- Ustaw tryb pracy: 0x38
- Ustaw pozycję kursora: 0x80 + pozycja(pomiędzy 0 a 15); 0xC0 + pozycja(pomiędzy 0 a 31)

Można również programować dowolne znaki lub symbole, co stwarza więcej możliwości i elastyczności w tworzeniu tekstu na wyświetlaczu.

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie**

Zadanie kinematyki dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie można rozwiązać korzystając z równania kinematyki prostoliniowej oraz równania kinematyki obrotowej.

Równanie kinematyki prostoliniowej opisuje ruch punktu na prostej linii i zapisuje się w postaci:

s = vt

gdzie:
- s to droga przebyta przez punkt
- v to prędkość punktu
- t to czas ruchu punktu

Równanie kinematyki obrotowej opisuje ruch obrotowy bryły sztywnej wokół osi obrotowej i zapisuje się w postaci:

θ = ωt

gdzie:
- θ to kąt obrotu bryły sztywnej
- ω to prędkość kątowa bryły sztywnej
- t to czas ruchu bryły sztywnej

Dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie, równanie kinematyki obrotowej można zapisać jako:

θ1 = ω1t

gdzie:
- θ1 to kąt obrotu łącza obrotowego
- ω1 to prędkość kątowa łącza obrotowego
- t to czas ruchu łącza obrotowego

Aby obliczyć prędkość kątową łącza obrotowego, można skorzystać ze wzoru:

ω1 = Δθ1/Δt

gdzie:
- Δθ1 to zmiana kąta obrotu łącza obrotowego
- Δt to czas potrzebny na zmianę kąta obrotu

Dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie, prędkość kątowa łącza obrotowego można obliczyć jako:

ω1 = (θ1 - θ0)/(t1 - t0)

gdzie:
- θ0 to początkowy kąt obrotu łącza obrotowego
- t0 to początkowy czas ruchu łącza obrotowego
- θ1 to końcowy kąt obrotu łącza obrotowego
- t1 to końcowy czas ruchu łącza obrotowego

Ostatecznie, drogę przebytą przez koniec ramienia manipulatora można obliczyć korzystając z równania kinematyki prostoliniowej:

s = rθ1

gdzie:
- r to długość łącza obrotowego.

Podsumowując, zadanie kinematyki dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie można rozwiązać korzystając z równania kinematyki prostoliniowej oraz równania kinematyki obrotowej. Oblicza się prędkość kątową łącza obrotowego oraz drogę przebytą przez koniec ramienia manipulatora.

# Plik. 34
**Zad. 1 Przedstaw i opisz elementy pamięci programu mikrokontrolera PIC16f877A.**

Mikrokontroler PIC16f877A posiada następujące elementy pamięci:

1. Pamięć programu - składa się z 14-bitowych słów programowych, które są przechowywane w pamięci Flash o pojemności 14KB. W tej pamięci przechowywany jest kod programu, który steruje działaniem mikrokontrolera.

2. Pamięć danych RAM - składa się z 368 bajtów pamięci, które są podzielone na obszary ogólnego przeznaczenia, stosu i rejestry specjalne. Pamięć ta służy do przechowywania zmiennych, flag i innych danych, które są potrzebne do wykonywania programu.

3. Rejestry specjalne - mikrokontroler posiada 21 jednobajtowych rejestrów, których wartości są wykorzystywane do zarządzania systemem mikrokontrolera. Rejestry te są dostępne bezpośrednio dla programisty i służą do m.in. ustawiania trybu pracy, ustawiania wejść/wyjść, konfiguracji przetworników ADC i PWM.

4. Pamięć EEPROM - mikrokontroler posiada 256 bajtów pamięci EEPROM, które służą do trwałego przechowywania danych, np. ustawień systemu, wyników pomiarów itp. Pamięć EEPROM jest zastosowana do przechowywania danych na dłuższy okres czasu, nawet po odłączeniu zasilania.

5. Pamięć programu BOOTLOADER - mikrokontroler posiada specjalny obszar pamięci Flash o pojemności 2KB, który jest wykorzystywany do ładowania programów przez komunikację szeregową UART, np. z użyciem modułu Bluetooth lub innego interfejsu komunikacyjnego.
 
Wszystkie te elementy pamięci są istotne dla działania mikrokontrolera i muszą być odpowiednio zaplanowane i zarządzane przez programistę. Dzięki wysokiej pojemności pamięci oraz możliwości tworzenia funkcjonalności bootloadera programista ma duże możliwości implementacji różnych funkcjonalności.

**Zad. 2 Wyjaśnij sposób działania konwertera analogowo-cyfrowego. Wyjaśnij jakie instrukcje są niezbędne do wykonania**

Konwerter analogowo-cyfrowy (ADC) przekształca sygnał analogowy na cyfrowy. Sygnał analogowy jest sygnałem ciągłym, a sygnał cyfrowy jest reprezentowany jako ciąg zer i jedynek. ADC składa się z dwóch głównych bloków: samplera i kwantyzatora.

Sampler pobiera próbkę sygnału analogowego co określoną jednostkę czasu. Częstotliwość próbkowania jest określona przez instrukcję programu. Im wyższa częstotliwość próbkowania, tym dokładniejszy sygnał cyfrowy.

Kwantyzator przekształca sygnał analogowy na sygnał cyfrowy. Pomiar jest tutaj dokonywany poprzez przydzielenie wartości cyfrowej do danego sygnału. Ten proces nazywa się kwantyzacją (określanie liczby bitów używanych do przechowywania wartości sygnału cyfrowego).

Aby korzystać z konwertera analogowo-cyfrowego, niezbędne jest wykonanie kilku instrukcji w kodzie programu. W pierwszej kolejności należy ustawić właściwy tryb konwersji (np. single-ended lub różnicowa). Następnie należy ustawić odpowiednie parametry, takie jak częstotliwość próbkowania, rozdzielczość, zakres wejściowy i wzmocnienie. W końcu należy rozpocząć konwersję i odczytać wynik.

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na**

podstawie obrotowej.

Zadanie: Dany jest manipulator złożony z jednego łącza pryzmatycznego zamontowanego na podstawie obrotowej. Długość łącza wynosi 0,5 m, a kąt obrotu podstawy wynosi 30 stopni. Oblicz położenie końca manipulatora i prędkość końca manipulatora.

Rozwiązanie: 

1. Wyznaczamy położenie końca manipulatora: 

Przyjmujemy, że baza manipulatora jest umieszczona w punkcie (0, 0). Po ustawieniu podstawy pod kątem 30 stopni, jej położenie wynosi (0, 0.5). Zastosujemy teraz proste zależności geometryczne: 

x = d*cos(theta) 
y = d*sin(theta) 

gdzie: 
- x, y - położenie końca manipulatora 
- d - długość łącza 
- theta - kąt obrotu podstawy 

Podstawiając wartości: 

x = 0.5*cos(30) = 0.433 
y = 0.5*sin(30) = 0.25 

Wynik: położenie końca manipulatora wynosi (0.433, 0.25).

2. Wyznaczamy prędkość końca manipulatora: 

Prędkość końca manipulatora wynika z ruchu obrotowego podstawy. Możemy ją wyznaczyć jako iloczyn kątowej prędkości podstawy i odległości od osi obrotu (czyli od punktu (0, 0)): 

v = w*d 

gdzie: 
- v - prędkość końca manipulatora 
- w - kątowa prędkość podstawy 
- d - odległość od osi obrotu 

Wartość odległości od osi obrotu wynosi 0.5 m (połowa długości łącza). Kątowa prędkość podstawy możemy wyznaczyć jako zmianę kąta w jednostce czasu: 

w = delta(theta)/delta(t) 

Nie podano jednak czasu, więc założymy, że kąt podstawy zmienia się o 30 stopni w ciągu jednej sekundy. Wtedy: 

w = 30/360 * 2*pi = 0.5236 rad/s 

Podstawiając wartości: 

v = 0.5236 * 0.5 = 0.262 m/s 

Wynik: prędkość końca manipulatora wynosi 0.262 m/s.

# Plik. 35
**Zad. 1 Przedstaw i opisz podstawowe elementy pamięci mikrokontrolera PIC16f877A.**

Podstawowe elementy pamięci mikrokontrolera PIC16f877A to:

1. Program Memory (Pamięć programu): Jest to pamięć nieulotna, w której przechowywany jest kod programu. PIC16f877A ma 14-bitową przestrzeń adresową programu, co oznacza, że można z niej korzystać z 8192 różnych adresów. Pamięć programu może zawierać zarówno program użytkownika, jak i firmware urządzenia.

2. Data Memory (Pamięć danych): Jest to pamięć ulotna, w której przechowywane są dane, zmienne i rejestry. PIC16f877A ma 8-bitową przestrzeń adresową danych, co oznacza, że można z niej korzystać z 256 różnych adresów. Pamięć danych dzieli się na dwie części:

- Ram Memory (Pamięć RAM): Jest to pamięć, którą mikrokontroler może odczytywać i zapisywać dane w czasie rzeczywistym. Jest to szybka pamięć, ale ulotna i wymaga zasilania, aby przechowywać dane.
- EEPROM Memory (Pamięć EEPROM): Jest to pamięć nieulotna, w której przechowywane są dane długotrwałe, takie jak informacje konfiguracyjne, hasła, numery seryjne itp. Pamięć EEPROM jest wolniejsza od RAM, ale jej dane pozostają zachowane nawet po wyłączeniu zasilania.

3. Special Function Registers (SFRs): Są to rejestry, które pełnią specjalne funkcje w mikrokontrolerze. Są to rejestry programowalne i służą do sterowania różnymi funkcjami urządzenia, takimi jak przerwania, timery, interfejsy komunikacyjne itp.

4. Stack Memory (Pamięć stosu): Jest to obszar w pamięci danych, który służy do przechowywania informacji o wykonywanych funkcjach i procedurach. W momencie wywołania funkcji, adres powrotu i zmienne są zapisywane na stosie, aby później można było odtworzyć stan przed wywołaniem funkcji.

**Zad. 2 Układ jest przedstawiony jak na rysunku, gdzie R1= 50Ω to impedancja układu zasilania, a Rs= 300Ω to**

impedancja obciążenia.

<center><img src="https://images.ctfassets.net/al7g91w3yd3h/6Q1WbkvYH5waFwztXtNWng/249b1a578f905d307b2c9a29de6974ba/circuit.png" alt="układ"></center>

Aby obliczyć natężenie prądu przechodzącego przez obwód, należy najpierw obliczyć całkowitą impedancję układu:

Z = R1 + Rs

Z = 50Ω + 300Ω

Z = 350Ω

Następnie należy obliczyć natężenie prądu stosując prawo Ohma:

I = V / Z

gdzie V to napięcie zasilania. Załóżmy, że napięcie zasilania wynosi 12V.

I = 12V / 350Ω

I = 0.034A = 34mA

Odpowiedź: Natężenie prądu przechodzącego przez obwód wynosi 34mA.

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie i połą-**

czonego z chwytakiem. 

W manipulatorze złożonym z jednego łącza obrotowego zamontowanego na bazie i połączonego z chwytakiem, parametry DH wyglądają następująco:

1. Theta (kąt obrotu): Kąt obrotu łącza obrotowego względem osi Z bazowego układu współrzędnych.

2. d (odległość): Odległość między osią Z bazowego układu współrzędnych, a osią obrotu łącza obrotowego.

3. a (długość): Długość łącza obrotowego.

4. Alpha (kąt obrotu): Kąt obrotu łącza obrotowego względem osi X bazowego układu współrzędnych.

Znając te parametry, można określić macierze transformacji DH dla każdego ogniwa manipulatora i obliczyć pozycję i orientację końcówki.

# Plik. 36
**Zad. 1 Opisz sposób działania stosu i instrukcje wykorzystywane do jego obsługi w mikrokontrolerach klasy PIC18fxx2 i**

Stos to struktura danych LIFO (Last-In-First-Out), która pozwala na przechowywanie danych w sposób uporządkowany. W mikrokontrolerach klasy PIC18fxx2 stos jest obsługiwany za pomocą rejestrów STKPTR oraz STKPTRH, które przechowują informacje o aktualnym stanie stosu.

Aby dodać dane na stos, należy użyć instrukcji PUSH lub LCALL, które umieszczają wartości na szczycie stosu. Natomiast, aby pobrać dane ze stosu, stosujemy instrukcję POP lub RETLW, która pobiera wartość ze szczycie stosu i usuwa ją z kolejki.

Do obsługi stosu w mikrokontrolerach klasy PIC18fxx2 wykorzystuje się również specjalne instrukcje, takie jak ADDWFC, ADDFSR, SUBWFB, które pozwalają na manipulowanie wartościami bezpośrednio na stosie.

Podsumowując, stos w mikrokontrolerach klasy PIC18fxx2 to ważny element struktury danych, której obsługa odbywa się za pomocą odpowiednich instrukcji i rejestrów. Dzięki temu możliwe jest przechowywanie i pobieranie danych w sposób uporządkowany i szybki.

**Zad. 2 Wyjaśnij sposób działania silnika krokowego w trybie z pełnym krokiem i jedną fazą aktywną, oraz w trybie z pełnym**

krokiem i dwoma fazami aktywnymi.

Silnik krokowy to rodzaj silnika elektrycznego, który obraca się zgodnie z impulsami elektrycznymi. Silnik krokowy wykonuje ruchy obrotowe dzięki zmiennym polom magnetycznym w jego wnętrzu.

Tryb z pełnym krokiem i jedną fazą aktywną

W trybie z pełnym krokiem i jedną fazą aktywną, tylko jedna z faz silnika krokowego jest aktywna. Zasilanie jednej cewki powoduje obrót silnika krokowego o jeden pełny krok. Następnie, gdy zasilana zostaje druga cewka, a pierwsza się wyłącza, silnik krokowy obraca się o kolejny pełny krok. W ten sposób silnik krokowy kręci się z pełnymi krokami, co oznacza, że każdy krok stanowi określoną, dokładną ilość obrotów.

Tryb z pełnym krokiem i dwoma fazami aktywnymi

W trybie z pełnym krokiem i dwoma fazami aktywnymi, dwie fazy silnika krokowego są aktywne jednocześnie. Ta metoda pozwala na jeszcze bardziej precyzyjne sterowanie ruchem silnika, co sprawia, że jest to najlepsza metoda do zastosowań wymagających bardziej płynnego i precyzyjnego ruchu. W sposób podobny do trybu z pełnym krokiem i jedną fazą aktywną, silnik obraca się z pełnymi krokami, ale ruch jest jeszcze bardziej dokładny, ponieważ dwa pola magnetyczne są aktywne jednocześnie. Krok silnika krokowego wynosi wtedy połowę kroku w trybie z pełnym krokiem i jedną fazą aktywną i pozostaje dokładny i precyzyjny.

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na bazie i**

zakończonego końcówką chwytającą za pomocą jednego przegubu obrotowego.

Aby wyznaczyć parametry DH dla takiego manipulatora, należy przejść przez poniższe kroki:

Krok 1: Zdefiniuj układ współrzędnych

Zdefiniujmy układ współrzędnych manipulatora. Jako punkt odniesienia, możemy wybrać środek bazy. Następnie, aby zdefiniować kierunek osi Z₁, należy wybrać kierunek, w którym znajduje się obrotowa oś przegubu, a jako os X₁ możemy wybrać os pionową skierowaną w dół. Ostatnio, jako os Y₁, możemy wybrać os równoległą do płaszczyzny roboczej manipulatora i skierowaną w kierunku przeciwnym do przeciwnym do ruchu wskazówek zegara.

Krok 2: Zdefiniuj położenia przegubów

Załóżmy, że przegub obrotowy jest umieszczony na końcu łącza pryzmatycznego i służy jako połączenie z końcówką chwytającą. Położenie przegubu określi się jako punkt, w którym kończy się łącze pryzmatyczne. Dla tego manipulatora można przyjąć, że przegub obrotowy jest jedynym przegubem, więc nie ma potrzeby definiowania położenia innych przegubów.

Krok 3: Zdefiniuj wektor osi przegubu

Oś przegubu obrotowego odpowiada osi Z, którą już zdefiniowaliśmy jako os Z₁. Nie ma potrzeby zdefiniowania innych wektorów osi, ponieważ manipulator składa się tylko z jednego przegubu.

Krok 4: Określ kąt obrotu przegubu

Kąt obrotu przegubu można określić, wykorzystując końcówkę chwytającą. Dla prostoty można założyć, że położenie końcówki chwytającej jest określone przez wartości kątowe wokół osi X, Y i Z. W przypadku tego manipulatora, będzie to tylko kąt obrotu wokół osi Z. Aby zdefiniować kąt obrotu, można przyjąć, że przyjmujemy jako początek kąta pozycję początkową, a następnie zmieniamy kąt odpowiednio do położenia końcówki chwytającej.

Krok 5: Wyznacz parametry DH

Mając zdefiniowane wektory osi, położenie przegubów i kąty obrotu, możemy teraz wyznaczyć parametry DH. W tym wypadku, parametry DH wynoszą:

- a₁ = 0 (odległość między osią Z₁ a Z)
- α₁ = 0 (kąt między osią Z₁ a Z)
- d₁ = 0 (odległość między osiami X₁ a X)
- θ₁ = kąt obrotu przegubu obrotowego

Ostatecznie, macierz transformacji jednorodnej dla tego manipulatora wygląda następująco:

cos θ₁ -sin θ₁ 0 0
sin θ₁ cos θ₁ 0 0
0 0 1 0
0 0 0 1

# Plik. 37
**Zad. 1 Wyjaśnij znaczenie ﬂag konﬁguracji w mikrokontrolerze PIC16f877A**

Flagi konfiguracji w mikrokontrolerze PIC16f877A to specjalne bity ustawień, które pozwalają na programowanie podstawowych funkcji mikrokontrolera. Są to bity, które odpowiadają za tryb pracy mikrokontrolera, rodzaj zegara, ustawienia pinów, ustawienia przerwań, itp. Flagi konfiguracji umożliwiają ustawienie parametrów mikrokontrolera, co jest konieczne dla każdej aplikacji, która ma być wykonana na tym mikrokontrolerze. Warto zauważyć, że flagi konfiguracji są bardzo ważne w mikrokontrolerach, ponieważ ustawienie niepoprawnego trybu pracy, zegara itp. może prowadzić do poważnych problemów z działaniem całego systemu.

**Zad. 2 Wyjaśnij zjawiska zachodzące w złączu P-N.**

Złącze P-N to połączenie półprzewodnika typu P (domieszkowany pierwiastkami trzeciej grupy, takimi jak bor) z półprzewodnikiem typu N (domieszkowany pierwiastkami piątej grupy, takimi jak fosfor). Zjawiska zachodzące w złączu P-N obejmują:

1. Zjawisko Dyfuzji: podczas dzień zmiany koncentracji wielkość

2. Zjawisko Deplekcji: W złączu P-N jest miejsce, w którym pojawił się polaryzacja. 

3. Efekt Halloa: Zjawisko to polega na powstaniu napięcia elektrycznego wzdłuż złącza P-N, gdy prąd płynie przez złącze pod wpływem pola magnetycznego.

4. Zjawisko Rekombinacji: W złączu P-N elektrony z domieszkowanego N i brakujące wprowadzone w P rejonie dziury rekombinują ze sobą. 

5. Zjawisko Bariera Energii: Na granicy złącza P-N pojawiła się bariera potencjału spowodowana różnicą koncentracji wewnątrz.

Wskutek tych zjawisk w złączu P-N następuje przepływ prądu i tworzenie warstwy zaporowej, która pozwala na kontrolowanie przepływu prądu w układzie elektronicznym.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

dP/dt = k*(P-Po)

gdzie:

P - wartość zmiennej, którą mierzy czujnik

Po - wartość docelowa (poziom zależny od zastosowania czujnika)

k - stała proporcjonalności

Równanie to opisuje zachowanie czujnika w czasie - dynamikę jego działania. Zmiana wartości zmierzonej przez czujnik przez czas jest opisana lewostronną pochodną tej wartości względem czasu. Stały człon k*(P-Po) określa, jaki jest aktualny wpływ odchylenia wartości zmierzonej od wartości docelowej na zmianę P w czasie. Im większe jest to odchylenie, tym większa jest siła, która zmienia P w kierunku Po. Stałą k należy dobrać odpowiednio do zastosowania czujnika i wymagań dotyczących jego dokładności i responsywności.

# Plik. 38
**Zad. 1 Czym jest histereza w układach wejściowo-wyjściowych.**

Histereza w układach wejściowo-wyjściowych oznacza zjawisko, w którym wartość wyjścia zależy nie tylko od wartości wejścia, ale także od historii zmian wartości wejścia. Innymi słowy, wartość wyjścia zależy od tego, czy zmiana wartości wejścia nastąpiła wzwyż czy w dół oraz od tego, jak dawno ta zmiana nastąpiła. Przykładami układów, w których występuje histereza, są przekaźniki elektromagnetyczne, narzędzia pomiarowe i elementy sterujące, takie jak regulatory temperatury czy czujniki wibracji. Histereza może wprowadzać błędy w pomiarach i utrudniać kontrolowanie wyjścia układu, co wymaga dostosowania parametrów regulatorów do konkretnych warunków pracy.

**Zad. 2 Oblicz, jaka jest ruchliwość manipulatora SCARA.**

Ruchliwość manipulatora SCARA zależy od jego konstrukcji oraz liczby stopni swobody. 

Standardowy manipulator SCARA ma cztery stopnie swobody, co oznacza, że może poruszać się w czterech różnych kierunkach. Konkretnie, może wykonywać ruchy liniowe wzdłuż dwóch osi poziomych (x i y) oraz ruchy obrotowe wokół dwóch osi pionowych (z i kątowa rotacja nad z). 

Ruchliwość manipulatora SCARA można obliczyć za pomocą formuły:

R = 6 - n - m

gdzie:
- R - ruchliwość manipulatora, czyli liczba niezależnych ruchów, jakie może wykonywać,
- n - liczba stopni swobody (degree of freedom, DOF),
- m - liczba zależności kinematycznych.

W przypadku standardowego manipulatora SCARA, mamy n = 4, ponieważ ma on cztery stopnie swobody. Jednak z powodu konstrukcji, kiedy ramię manipulatora jest całkowicie rozprostowane, jego końcówka jest ledwo poruszalna. Dlatego manipulator SCARA ma jedną zależność kinematyczną (m = 1), która ogranicza jego ruchliwość.

Stąd wynika, że ruchliwość manipulatora SCARA wynosi:

R = 6 - 4 - 1 = 1

Oznacza to, że manipulator SCARA może wykonywać tylko jeden niezależny ruch w dowolnym punkcie przestrzeni roboczej.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Dany jest czujnik opisany równaniem różniczkowym, które opisuje zależność między sygnałem wyjściowym czujnika a wartością mierzonej wielkości. Równanie to można zapisać w postaci:

y(t) = f(x(t))

gdzie:
- y oznacza sygnał wyjściowy czujnika,
- x oznacza wartość mierzonej wielkości,
- t oznacza czas,
- f jest funkcją opisującą charakterystykę czujnika.

Przykładowo, jeśli czujnik jest termometryczny, to sygnał wyjściowy będzie zależał od temperatury mierzonej przez ten czujnik. Funkcja f opisuje wtedy charakterystykę konkretnego czujnika termometrycznego i pozwala na przeliczenie wartości temperatury na sygnał elektryczny, który może być przetworzony przez urządzenia pomiarowe.

# Plik. 39
**Zad. 1 W jaki sposób zjawisko piezoelektryczne jest wykorzystywane do budowy mikrofonów.**

Zjawisko piezoelektryczne jest wykorzystywane do budowy mikrofonów elektrodynamcznych. Mikrofony te zawierają błonę piezoelektryczną, która ulega deformacji w wyniku fali dźwiękowej. Ta deformacja generuje napięcie elektryczne, które jest wzmacniane przez układy elektroniczne w mikrofonie i przekształcane na sygnał dźwiękowy. 

Błona piezoelektryczna w mikrofonie składa się z kryształów lub ceramicznego materiału piezoelektrycznego, który jest połączony z metalowymi elektrodami. Gdy fala dźwiękowa uderza w błonę, powoduje jej deformację, co zmienia polaryzację kryształów piezoelektrycznych i generuje napięcie elektryczne na metalowych elektrodach. 

Napięcie to jest następnie przetwarzane przez układy elektroniczne w mikrofonie, takie jak wzmacniacze sygnału, filtry i układy redukcji szumów. W końcu, sygnał jest składowany w postaci cyfrowej lub analogowej. Mikrofony elektrodynamczne są szeroko stosowane w różnych zastosowaniach, takich jak nagrywanie wokalu, instrumentów muzycznych, emisji głosu w systemach bezprzewodowych oraz w pomiarach akustycznych i wibracyjnych.

**Zad. 2 Oblicz, jaka jest ruchliwość (typowego) manipulatora ramieniowego.**

Nie jest możliwe jednoznaczne określenie ruchliwości typowego manipulatora ramieniowego, ponieważ ruchliwość zależy od wielu czynników, takich jak liczba stopni swobody, długość ramion, prędkość i siła napędów oraz styl pracy manipulatora. Jednakże, typowe manipulatory ramieniowe mają zwykle od 4 do 6 stopni swobody, co oznacza, że mogą wykonywać ruchy w 4-6 kierunkach lub płaszczyznach. Ostatecznie, ruchliwość manipulatora ramieniowego zależy od konkretnej konstrukcji urządzenia i jej przeznaczenia.

**Zad. 3 Dany jest czujnik opisany równaniem różniczkowym**

Nie jestem w stanie podać równania różniczkowego opisującego dany czujnik bez dodatkowych informacji na temat jego charakterystyki i działania. Proszę o podanie bardziej szczegółowego opisu czujnika lub jego nazwy.

# Plik. 40
**Zad. 1 Wyjaśnij sposób działania termopary i łańcucha termicznego.**

Termopara to urządzenie pomiarowe służące do pomiaru temperatury. Składa się ona z dwóch różnych metalowych przewodów połączonych ze sobą w jednym końcu, a w drugim końcu przetwarzający sygnał elektryczny. Kiedy temperatura końca pomiarowego ulega zmianie, to powoduje to produkcję różnicy potencjałów pomiędzy metalowymi przewodami. Ta różnica potencjałów jest proporcjonalna do różnicy temperatur pomiędzy końcami metalowych przewodów, co umożliwia pomiar temperatury.

Lancuch termiczny natomiast to zestaw elementów połączonych ze sobą termicznie, mających za zadanie przekazywanie ciepła z jednego punktu na inny. Składa się z termopary (odpowiednio skonfigurowanej, tj. w zależności od zastosowania), przewodów połączeniowych i źródła ciepła. Pomiar temperatury w takim systemie można przeprowadzić w różnych punktach w zależności od ułożenia termopary i przewodów. Podczas tego procesu zachodzą różne procesy termodynamiczne, np. przewodzenie, konwekcja czy promieniowanie, które decydują o przenoszeniu energii cieplnej pomiędzy poszczególnymi elementami łańcucha termicznego.

**Zad. 2 Wykonaj obrót punktu [1,1,1]o30◦dookoła wektora [0.5,0.4,0.3]. Zamieść odpowiednie obliczenia.**

Aby wykonać obrót punktu o 30° wokół wektora, należy najpierw obliczyć macierz obrotu dla tego kąta i wektora, a następnie pomnożyć ją przez współrzędne punktu.

Macierz obrotu dla kąta 30° i wektora [0.5,0.4,0.3] można obliczyć według następującego wzoru:

cos(30°)   + (1 - cos(30°)) * 0.5^2      + (1 - cos(30°)) * 0.5 * 0.4  - sin(30°) * 0.3
(1 - cos(30°)) * 0.5 * 0.4  + cos(30°)       + (1 - cos(30°)) * 0.4^2      + sin(30°) * 0.5
(1 - cos(30°)) * 0.5 * 0.3  - sin(30°) * 0.4 + (1 - cos(30°)) * 0.4 * 0.3  + cos(30°)

gdzie "cos(30°)" i "sin(30°)" odpowiadają wartościom cosinus i sinus kąta 30°.

Po obliczeniu macierzy możemy pomnożyć ją przez wektor [1,1,1] w celu uzyskania współrzędnych punktu po obróceniu:

cos(30°)   + (1 - cos(30°)) * 0.5^2      + (1 - cos(30°)) * 0.5 * 0.4  - sin(30°) * 0.3    |     1
(1 - cos(30°)) * 0.5 * 0.4  + cos(30°)       + (1 - cos(30°)) * 0.4^2      + sin(30°) * 0.5    |  *  1
(1 - cos(30°)) * 0.5 * 0.3  - sin(30°) * 0.4 + (1 - cos(30°)) * 0.4 * 0.3  + cos(30°)         |     1

Po pomnożeniu otrzymujemy:

[1.1917, 1.0585, 0.8567]

Współrzędne punktu po obróceniu wynoszą [1.1917, 1.0585, 0.8567].

**Zad. 3 Wyznacz (przybliżoną) liniową charakterystykę wejściowo-wyjściową czujnika, dla którego zebrano doświadczalnie**

dane przedstawione w poniższej tabeli:

| Wejście [V] | Wyjście [mA] |
|------------|--------------|
| 0          | 0            |
| 0.5        | 1.2          |
| 1.0        | 2.5          |
| 1.5        | 3.8          |
| 2.0        | 5.0          |

Aby wyznaczyć liniową charakterystykę wejściowo-wyjściową czujnika należy posłużyć się regresją liniową. W przypadku tych danych zastosowanej regresji można dokonać na przykład za pomocą programu Excel. 

Po wpisaniu danych do arkusza kalkulacyjnego, należy wybrać opcję wykresu i zaznaczyć linię trendu (tutaj regresję liniową). W rezultacie otrzymujemy wykres z prostą, która najlepiej odwzorowuje zależność między wejściem a wyjściem. 

Dla tych konkretnych danych, liniowa charakterystyka wejściowo-wyjściowa czujnika może wyglądać następująco:

y = 2.5x - 0.5 

gdzie y oznacza wyjście [mA], a x wejście [V]. 

Jest to prosty wzór funkcji liniowej, która w uproszczony sposób opisuje zachowanie badanego czujnika. Oczywiście, warto pamiętać, że w każdym przypadku dobór najlepszego modelu opisu zależności między danymi zależy od charakteru badanego procesu oraz od jakości zebranych danych.

# Plik. 41
**Zad. 1 Wyjaśnij sposób działania kamery CCD.**

Kamera CCD (przetwornik ładunkowy) składa się z matrycy mikroskopijnych pikseli, które rejestrują światło padające na nie. Piksele są naładowane elektrycznie, a gdy światło pada na piksel, fotoelektrony są wybijane z tej naładowanej warstwy. 

Gdy fotoelektrony zostają uwolnione, są one przyciągane przez napięcie elektryczne i gromadzone na specjalnych pojemnikach nazywanych także "studniami ładunkowymi". Kiedy matryca pikseli zostaje oświetlona, studnie ładunkowe wypełniają się różnymi ilościami ładunków, reprezentującymi różne poziomy jasności piksela.

Następnie, po pokryciu całej matrycy, ładunki są odczytywane przez układ odczytu, który przesyła te dane do przetwornika analogowo-cyfrowego (ADC). 

ADC przekształca sygnał analogowy na cyfrowy, co pozwala na zapisanie danych w postaci pliku numerycznego na pamięci karty. W ten sposób uzyskujemy kolorową lub monochromatyczną reprezentację obrazu zarejestrowanego przez kamerę CCD. 

Warto zauważyć, że kamera CCD umożliwia rejestrowanie obrazu tylko w warunkach dobrze oświetlonych, ponieważ im mniej światła pada na piksele, tym trudniejsze staje się ich odczytanie.

**Zad. 2 Wyjaśnij sposób oprogramowywania wyświetlacza HD44780. Wyjaśnij jakie instrukcje są niezbędne do wyświetlenia**

Tekstu na wyświetlaczu HD44780 można programować za pomocą mikrokontrolera, takiego jak Arduino lub Raspberry Pi. Aby zacząć, należy podłączyć wyświetlacz do płytki rozwojowej zgodnie z instrukcją producenta.

Następnie należy wysyłać instrukcje do wyświetlacza poprzez połączenie danych i sterowania. W przypadku wyświetlacza HD44780 są to 8 lub 4 linie danych oraz 3 linie sterujące: RS (Register Select), E (Enable) i R/W (Read/Write).

W celu wyświetlenia tekstu należy przesłać kilka instrukcji do wyświetlacza, w tym:

1. Ustawienie trybu wyświetlania: 8-bitowy lub 4-bitowy.
2. Włączenie wyświetlacza.
3. Ustawienie kursora na początku pierwszej linii.
4. Wysłanie danych do wyświetlacza, w tym znaków, znaków specjalnych i poleceń.

Porównanie 4-bitowego i trybu 8-bitowego:

W trybie 8-bitowym każdy bajt danych wysyłany jest za pomocą ośmiu linii danych, a w trybie 4-bitowym za pomocą czterech linii. Tryb 4-bitowy wymaga odczytania i zapisu mniej danych, co może przyspieszyć komunikację między mikrokontrolerem a wyświetlaczem.

Przykłady instrukcji:

- Ustawienie trybu 4-bitowego:
RS=0,E=1,D7-D4=0x02,E=0

- Włączenie wyświetlacza i kursora:
RS=0,E=1,D7-D4=0x0E,E=0

- Ustawienie kursora na początku pierwszej linii:
RS=0,E=1,D7-D4=0x80,E=0

- Wysłanie tekstu, np. "Hello World!":
RS=1,E=1,D7-D4='H',E=0,E=1,D7-D4='e',E=0,E=1,D7-D4='l',E=0,E=1,D7-D4='l',E=0,E=1,D7-D4='o',E=0,E=1,D7-D4=' ',E=0,E=1,D7-D4='W',E=0,E=1,D7-D4='o',E=0,E=1,D7-D4='r',E=0,E=1,D7-D4='l',E=0,E=1,D7-D4='d',E=0,E=1,D7-D4='!',E=0

Wysyłając te instrukcje w odpowiedniej kolejności i z odpowiednimi parametrami, można wyświetlić dowolny tekst na wyświetlaczu HD44780.

# Plik. 42
**Zad. 1 Wyjaśnij sposób działania konwertera analogowo-cyfrowego. Zamieść niezbędne obliczenia.**

Konwerter analogowo-cyfrowy (ADC) służy do przetworzenia sygnału analogowego (np. napięcia) na sygnał cyfrowy. W celu dokonania pomiaru, sygnał analogowy jest próbkowany, czyli pobierane są próbki sygnału w określonych momentach czasowych. Następnie sygnał ten jest kwantowany, czyli sygnał analogowy jest zaokrąglany do najbliższej wartości z określonej skali. W przypadku kwantyzacji równomiernych, skala jest podzielona na równe przedziały o szerokości Δ:

Vquant = Δ * round (Vinput / Δ)

Gdzie:
Vinput – wartość sygnału wejściowego,
Δ – szerokość przedziału kwantyzacji,
Vquant – wartość skwantowana sygnału.

Następnie wartości skwantowane są kodowane w formacie binarnym. Ilość bitów wykorzystywanych do kodowania wartości (rozmiar słowa) wpływa na dokładność pomiaru. Im większy rozmiar słowa, tym większa dokładność, ale również większe wymagania dla przetwarzania danych. 

Korzystając z konwertera ADC można w prosty sposób zbadać zmiany sygnału analogowego i przekształcić je na komputerową postać, co pozwala na ich dalsze przetwarzanie i analizę.

**Zad. 2 Wyjaśnij sposób działania konwertera analogowo-cyfrowego. Wyjaśnij jakie instrukcje są niezbędne do wykonania**

Konwerter analogowo-cyfrowy (ADC) jest urządzeniem elektronicznym, który przetwarza sygnał analogowy na sygnał cyfrowy. Sygnał analogowy jest w postaci ciągłej zmienności sygnału, natomiast sygnał cyfrowy jest w postaci ciągu impulsów. Konwerter analogowo-cyfrowy składa się z kilku bloków: wzmacniacza, komparatora, licznika oraz rejestru przesuwnego.

Wzmacniacz wzmacnia sygnał analogowy do odpowiedniego poziomu, aby móc go porównać z ustaloną wartością progową przez komparator. Komparator porównuje sygnał analogowy z wartością progową i generuje impuls cyfrowy o wartości 0 lub 1. Licznik zlicza pulsacje cyfrowe, aż do momentu, gdy generowany jest impuls wystarczająco silny, aby licznik zmienił swoją wartość. Ostatecznie, wartość zapisana w liczniku jest przesuwana do rejestru przesuwnego, z którego można ją odczytać w postaci kodu binarnego.

Aby wykonać konwersję analogowo-cyfrową, należy ustawić wartość napięcia wejściowego oraz dokładność konwersji. Następnie należy przekazać sygnał wejściowy do wzmacniacza i ustawić wartość progową w komparatorze. Po wykonaniu konwersji, wartość cyfrowa jest przenoszona do rejestru przesuwnego, aby umożliwić jego odczytanie.

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie**

Nie zostały podane żadne wartości, więc nie można rozwiązać tego zadania, ale można przedstawić ogólną metodę rozwiązania:

1. Określ układ współrzędnych, w którym będziesz opisywał ruch manipulatora (np. układ kartezjański czy biegunowy).
2. Przyjmij jakieś wartości dla kąta obrotu łącza (np. 30 stopni) oraz prędkości obrotowej łącza (np. 2 obr./s).
3. Korzystając z geometrii manipulatora oraz wartości kąta obrotu, oblicz położenie końca manipulatora (np. końcówki narzędzia) względem układu współrzędnych.
4. Korzystając z kinematyki odwrotnej, oblicz wartości kątów w stawach pozwalające na osiągnięcie pożądanego położenia końca manipulatora.
5. Przyjmij jakieś wartości dla przyspieszenia obrotowego łącza (np. 5 obr./s^2) oraz czasu trwania ruchu (np. 2 s).
6. Korzystając z równań kinematycznych, oblicz wartości prędkości oraz przyspieszeń w stawach w trakcie ruchu.
7. Sprawdź, czy wartości prędkości i przyspieszeń są zgodne z możliwościami mechanicznymi manipulatora (np. czy przyspieszenie nie przekracza dopuszczalnych wartości).
8. Można przedstawić ruch manipulatora w postaci wykresów zależności kąta, prędkości i przyspieszenia od czasu.

# Plik. 43
**Zad. 1 Wyjaśnij sposób działania konwertera cyfrowo-analogowego. Zamieść niezbędne obliczenia.**

Konwerter cyfrowo-analogowy (DAC) to urządzenie, które przetwarza dane cyfrowe na sygnał analogowy, który może być wykorzystany do sterowania urządzeniami takimi jak głośniki, motory, pompy, itp. 

Sposób działania konwertera cyfrowo-analogowego polega na przetwarzaniu wartości cyfrowych na wartości analogowej napięcia lub prądu. Najprostszy rodzaj DAC-a to konwerter typu trybuieńczego, w którym każdy bit sygnału cyfrowego jest konwertowany na oznaczoną wartość napięcia lub prądu. 

Na przykład, jeśli mamy 8-bitowy sygnał cyfrowy, który ma wartość 10101101 (w systemie dziesiętnym 173), każdy bit może być konwertowany na napięcie lub prąd odpowiadający 1/256 całkowitej wartości wyjściowej. Ostatecznie, w pełni skonwertowany sygnał wyjściowy będzie równy:

Vout = (1/256) * (1*1 + 0*2 + 1*4 + 0*8 + 1*16 + 1*32 + 0*64 + 1*128)

Vout = (1/256) * (173)

Vout = 0.676 V

Wartość napięcia lub prądu, którą można uzyskać jako wynik konwersji, może być kontrolowana przez użytkownika poprzez wybór odpowiedniego punktu odniesienia, który określa zakres wartości analogowych. Dla przykładu, jeśli chcemy uzyskać napięcie wyjściowe w zakresie 0-5 V, wtedy każdej wartości analogowej odpowiada 19,53 mV. 

Konwerter cyfrowo-analogowy może być również stosowany w wielu innych aplikacjach, np. sterowaniu silnikami, pilotowaniu wyświetlaczy LCD, konstrukcji układów chirurgicznych, wprowadzaniu zmian w sygnale dźwiękowym lub graficznym, itp.

**Zad. 2 Układ jest przedstawiony jak na rysunku, gdzie R1= 50Ω to impedancja układu zasilania, a Rs= 300Ω to**

impedancja obciążenia. 

![UKŁAD](https://i.imgur.com/SgCOvls.png)

Aby obliczyć prąd I płynący przez obciążenie, musimy najpierw obliczyć napięcie V wyjściowe z układu.

Wykorzystując podział napięcia i zastępując impedancję szeregową R1 i Rs impedancją zastępczą, otrzymujemy:

V = Vi * Rs / (R1 + Rs) = 10 * 300 / (50 + 300) = 8 V

Następnie, wykorzystując prawo Ohma, możemy obliczyć prąd płynący przez obciążenie:

I = V / Rs = 8 / 300 = 0,0267 A = 26,7 mA

Odpowiedź: Prąd płynący przez obciążenie wynosi 26,7 mA.

**Zad. 3 Rozwiąż proste zadanie kinematyki dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na**

podstawie obrotowej.

Nie podano dokładnego sformułowania zadania, dlatego poniżej przedstawione zostaną ogólne zasady ruchu manipulatora złożonego z jednego łącza pryzmatycznego.

Manipulator złożony z jednego łącza pryzmatycznego umieszczony na podstawie obrotowej może osiągnąć różne położenia i orientacje w przestrzeni. Aby opisać jego ruch, stosuje się parametry opisujące położenie i orientację łącza.

Położenie łącza można opisać za pomocą współrzędnych kartezjańskich x, y, z, określających położenie końca łącza w przestrzeni. Orientacja łącza opisywana jest za pomocą tzw. kątów Eulera, które określają, jak łącze powinno być obrócone wokół trzech osi: x, y, z.

Dla manipulatora złożonego z jednego łącza pryzmatycznego istnieją dwa rodzaje ruchów: ruch translacyjny oraz ruch obrotowy.

W ruchu translacyjnym łącze porusza się wzdłuż jednej z osi kartezjańskich, przy czym orientacja łącza pozostaje niezmieniona. Przykładowo, jeśli łącze przesuwa się wzdłuż osi x, to współrzędna x zmienia się, a pozostałe współrzędne i kąty Eulera pozostają stałe.

W ruchu obrotowym łącze obraca się wokół jednej z osi, zmieniając jednocześnie swoją orientację. Przykładowo, jeśli łącze obraca się wokół osi x, to zmieni się wartość jednego z kątów Eulera, a pozostałe współrzędne i kąty pozostaną stałe.

Aby manipulator mógł poruszać się po określonym torze ruchu, należy zaplanować sekwencję ruchów. Można to zrobić za pomocą trzech metod: ruchu prostoliniowego, interpolacji linowej i interpolacji spline’ów.

W ruchu prostoliniowym manipulator przesuwa się po linii prostej, łączącej początkową i końcową pozycję. W tym przypadku należy określić punkty startowy i końcowy oraz prędkość ruchu.

Interpolacja linowa polega na interpolowaniu liniowo pomiędzy dwoma punktami ruchu, przy czym określa się prędkość manipulatora w punkcie początkowym i końcowym.

Interpolacja spline’ów polega na interpolowaniu między punktami z użyciem krzywych spline’ów. W tym przypadku manipulator porusza się po krzywej, przy czym określa się kształt spline’ów oraz prędkość ruchu.

Wszystkie te metody pozwalają na zaplanowanie ruchu manipulatora złożonego z jednego łącza pryzmatycznego. Jednakże, w celu wykonania zadania, konieczne jest określenie celu ruchu oraz trajektorii, którą manipulator powinien przebyć, co zależy od konkretnego zadania.

# Plik. 44
**Zad. 1 Wyjaśnij zastosowanie Supervisor-a w oprogramowaniu Webots. Pokaż jak i jakie instrukcje służą do odczytywania**

i kontrolowania Supervisor-a w Webots.

Supervisor w oprogramowaniu Webots jest głównym kontrolerem symulacji, który zarządza środowiskiem symulacji oraz interakcjami pomiędzy różnymi obiektami w symulacji. Supervisor umożliwia również komunikację z zewnętrznymi programami, dzięki czemu można zintegrować symulację z innymi systemami.

Instrukcje do odczytywania i kontrolowania Supervisor-a w Webots zależą od języka programowania, w którym piszemy kod kontrolera. Przykładowo, w języku Python możemy użyć następujących instrukcji:

1. Supervisor.getTime() - zwraca aktualny czas symulacji.
2. Supervisor.setLabel(1, 'Hello world!') - umieszcza etykietę "Hello world!" na pierwszym obiekcie w symulacji.
3. node = Supervisor.getFromDef('ROBOT') - pobiera obiekt o nazwie "ROBOT".
4. node.getField('translation').setSFVec3f([1, 0, 0]) - ustawia wartość pola "translation" obiektu na [1, 0, 0].

Powyższe instrukcje ilustrują kilka sposobów, w jakie można odczytywać i kontrolować Supervisor-a w Webots. Można użyć ich do tworzenia kontrolerów robotów, detekcji kolizji, zarządzania światłami i wiele innych zadań.

**Zad. 2 Wyjaśnij sposób działania silnika krokowego w trybie z pełnym krokiem i jedną fazą aktywną, oraz w trybie z pełnym**

krokiem i dwoma fazami aktywnymi.

Silnika krokowego w trybie z pełnym krokiem i jedną fazą aktywną:

W trybie z pełnym krokiem i jedną fazą aktywną, silnik krokowy działa na zasadzie przemieszczania się zatrzasków magnetycznych między dwoma cewkami. Jeden obieg silnika składa się z czterech kroków, co oznacza, że przy każdym kroku następuje obrót wału silnika o kąt 90 stopni.

Faza aktywna wskazuje na to, którą z cewek należy w danym momencie zasilić. W przypadku trybu z pełnym krokiem i jedną fazą aktywną, zasila się jedną z cewek, a drugą pozostawia się bez zasilania.

Pierwszy krok: Zasilenie pierwszej cewki powoduje obrót wału silnika o 90 stopni w kierunku zgodnym z ruchem wskazówek zegara.

Drugi krok: Odłączenie zasilania z pierwszej cewki, a następnie zasilenie drugiej cewki, powoduje obrót wału silnika o kolejne 90 stopni.

Trzeci krok: Odłączenie zasilania z drugiej cewki, a następnie zasilenie pierwszej cewki z przeciwną polaryzacją, powoduje obrót wału silnika o kolejne 90 stopni.

Czwarty krok: Odłączenie zasilania z pierwszej cewki z przeciwną polaryzacją, a następnie zasilenie drugiej cewki z przeciwną polaryzacją, powoduje obrót wału silnika o kolejne 90 stopni.

Silnika krokowego w trybie z pełnym krokiem i dwoma fazami aktywnymi:

W trybie z pełnym krokiem i dwoma fazami aktywnymi, każdy obieg silnika składa się z ośmiu kroków, co oznacza, że przy każdym kroku następuje obrót wału o kąt 45 stopni.

W przypadku trybu z pełnym krokiem i dwoma fazami aktywnymi, zasilane są dwie cewki na przemian, co powoduje zwiększenie kąta obrotu przy każdym kroku.

Podczas pracy silnika w trybie z pełnym krokiem i dwoma fazami aktywnymi, krok kolejny jest realizowany przez zasilanie kolejnych cewek w cyklu AB-BC-CD-DA.

Pierwszy krok: Zasilenie cewki A powoduje obrót wału silnika o 45 stopni w kierunku zgodnym z ruchem wskazówek zegara.

Drugi krok: Zasilenie cewki B powoduje obrót wału silnika o kolejne 45 stopni.

Trzeci krok: Zasilenie cewki C powoduje obrót wału silnika o kolejne 45 stopni.

Czwarty krok: Zasilenie cewki D powoduje obrót wału silnika o kolejne 45 stopni.

Kolejne kroki są realizowane przez ciągłe zasilanie dwóch kolejnych cewek w cyklu AB-BC-CD-DA.

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza obrotowego zamontowanego na bazie i połą-**

czonego z jednym przegubem obrotowym w końcu.

Parametry DH dla manipulatora:

1. Tworzenie osi z

- z1 - obrót wokół osi z, punkt A do punktu B, prostokątny do osi x
- z2 - obrót wokół osi z, punkt B do punktu C, prostokątny do osi x

2. Tworzenie osi x

- x0 - punkt C do D, prostokątny do płaszczyzny xy
- x1 - punkt B do punktu C, nachylony o kąt 90° w kierunku osi z
- x2 - punkt A do punktu B, prostokątny do osi z

3. Długości ogniw

- d1 - odległość między osią z1 a z2
- a1 - odległość między osią x0 a x1
- a2 - odległość między osią x1 a x2

4. Kąty przegubów

- θ1 - obrót wokół osi z1
- θ2 - obrót wokół osi z2

Parametry DH:
- d1 = 0
- a1 = 0
- a2 = l1
- θ1 = 0
- θ2 = θ

Gdzie l1 to długość łącza, a θ to kąt obrotu drugiego przegubu.

# Plik. 45
**Zad. 1 Wyjaśnij pojęcie przekształceń jednorodnych.**

Przekształcenia jednorodne to takie przekształcenia geometryczne, które zachowują proporcjonalne relacje między wielkościami. Innymi słowy, jeśli dana figura zostanie przemnożona przez pewną stałą, to wszystkie jej wymiary zostaną pomnożone przez tę samą stałą. Przykładowo, gdy mamy trójkąt o podstawie 3 cm i wysokości 4 cm, przemnożenie go przez 2 da nam trójkąt o podstawie 6 cm i wysokości 8 cm. Przekształcenia jednorodne są przydatne w matematyce, fizyce i innych naukach, gdzie stosuje się je do opisu skali i proporcji wielkości w różnych kontekstach.

**Zad. 2 Wyjaśnij zjawiska zachodzące w złączu P-N.**

Złącze P-N jest złączem pomiędzy dwoma półprzewodnikami o różnych typach przewodnictwa: z jednej strony półprzewodnikiem typu P (zdominowanym przez domieszkę akceptorową), a z drugiej strony półprzewodnikiem typu N (z domieszką donorową). 

Podczas łączenia tych dwóch półprzewodników dochodzi do migracji nośników ładunku z jednego do drugiego materiału. Elektrony z półprzewodnika N migrują do półprzewodnika P, gdzie reagują z wolnymi "dziurami" (brakującymi elektronami) uwięzionanymi w domieszce akceptorowej. W wyniku reakcji elektronów i dziur powstają powiązania kowalencyjne między atomami półprzewodnika, co skutkuje utworzeniem obszaru o zubożonej domieszce (region zaporowy).

Region ten powoduje, że złącze P-N staje się diodą półprzewodnikową. Podczas przepływu prądu przez diodę, elektrony przepływają z obszaru N do P, a dziury z obszaru P do N, ale nie mogą one przeskoczyć na przeciwną stronę, ponieważ napotykają barierę w postaci zubożonej strefy. W ten sposób złącze P-N przewodzi prąd tylko w jednym kierunku, a w drugim pełni funkcję izolatora. 

Pod wpływem polaryzacji zewnętrznej, np. przy podłączeniu zewnętrznej baterii, w obszarze P (polaryzacja dodatnia) elektrony zdominowane przez większą ilość "dziur" zaczynają przesuwać się ku złączu. Jednocześnie w obszarze N (polaryzacja ujemna) elektrony zaczynają przesuwać ku złączu i reagują z dziurami w domieszce akceptorowej. W wyniku tych procesów zęby zwiększa się szerokość zubożonej strefy, a w konsekwencji zwiększa się opór diody. 

Zjawiska zachodzące w złączu P-N mają wiele zastosowań w elektronice i są podstawą funkcjonowania wielu elementów, takich jak diody, tranzystory czy fotodiody.

**Zad. 3 Wyznacz parametry DH dla manipulatora złożonego z jednego łącza pryzmatycznego zamontowanego na bazie i**

ze stawem obrotowym na końcu łącza.

Parametry DH definiują zależności geometryczne i kinematyczne pomiędzy kolejnymi ogniskami manipulatora. Aby wyznaczyć parametry DH dla takiego manipulatora, należy:

1. Zdefiniować układ odniesienia: Na rysunku poniżej zaznaczono układ odniesienia, w którym rozważany będzie manipulator. Układ ten ma jednostkowe wektory wzdłuż osi x, y i z, które odpowiadają kolejno kierunkowi bazy, pierwszemu łączu i końcowemu stawowi obrotowemu. Wyznaczamy również środek masy i długość łącza pryzmatycznego.

![manipulator_prismatyczny.png](https://drive.google.com/uc?id=1yCvK4L4JQXxpIwnx0WZJ828HYRykchYC)

2. Podzielić manipulator na segmenty:
W tym przypadku manipulator składa się tylko z jednego segmentu - łącza pryzmatycznego.

3. Dla każdego segmentu zdefiniować parametry DH:  

W przypadku łącza pryzmatycznego, zdefiniujemy jedną parę parametrów DH:

- $\theta_i$ - kąt między osią $Z_i$ a osią $Z_{i-1}$ - w tym przypadku $\theta_1 = 0$ ze względu na położenie bazy
- $d_i$ - odległość między osią $Z_{i-1}$ a osią $Z_i$ - tutaj $d_1$ będzie równe długości łącza pryzmatycznego
- $a_i$ - odległość między osią $X_{i-1}$ a osią $X_i$ - w tym przypadku $a_1 = 0$ ponieważ osie $X_0$ i $X_1$ nachodzą na siebie
- $\alpha_i$ - kąt między osią $X_{i-1}$ a osią $X_i$ - tutaj $\alpha_1 = \pi/2$ ponieważ oś $X_1$ jest prostopadła do osi $Z_0$ i kieruje się w stronę osi $X_0$

Ostatecznie, parametry DH dla manipulatora składającego się z jednego łącza pryzmatycznego wyglądają następująco:
$\theta_1 = 0$
$d_1 = l$
$a_1 = 0$
$\alpha_1 = \pi/2$,

gdzie $l$ to długość łącza pryzmatycznego.

