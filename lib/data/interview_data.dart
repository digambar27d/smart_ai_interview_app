// ─────────────────────────────────────────────────────────────────────────────
// InterviewData — Branch → Subject → Topic → Questions
// ─────────────────────────────────────────────────────────────────────────────

class InterviewData {
  // ── Branches ──────────────────────────────────────────────────────
  static const List<Map<String, String>> branches = [
    {'name': 'CSE',   'full': 'Computer Science Engineering',     'icon': '💻'},
    {'name': 'IT',    'full': 'Information Technology',           'icon': '🌐'},
    {'name': 'ECE',   'full': 'Electronics & Communication Engg', 'icon': '📡'},
    {'name': 'EEE',   'full': 'Electrical & Electronics Engg',    'icon': '⚡'},
    {'name': 'ME',    'full': 'Mechanical Engineering',           'icon': '⚙️'},
    {'name': 'Civil', 'full': 'Civil Engineering',                'icon': '🏗️'},
  ];

  // ── Subjects per branch ───────────────────────────────────────────
  static const Map<String, List<Map<String, String>>> subjects = {
    'CSE': [
      {'name': 'Data Structures',   'icon': '🌳'},
      {'name': 'Algorithms',        'icon': '⚡'},
      {'name': 'DBMS',              'icon': '🗄️'},
      {'name': 'Operating Systems', 'icon': '🖥️'},
      {'name': 'Computer Networks', 'icon': '🌐'},
      {'name': 'OOPs',              'icon': '🔷'},
      {'name': 'System Design',     'icon': '🏗️'},
    ],
    'IT': [
      {'name': 'Web Technologies',  'icon': '🌐'},
      {'name': 'Cloud Computing',   'icon': '☁️'},
      {'name': 'Cybersecurity',     'icon': '🔒'},
      {'name': 'Data Structures',   'icon': '🌳'},
      {'name': 'DBMS',              'icon': '🗄️'},
      {'name': 'Software Engineering','icon': '📐'},
    ],
    'ECE': [
      {'name': 'Digital Electronics',   'icon': '💡'},
      {'name': 'Analog Electronics',    'icon': '📊'},
      {'name': 'Signals & Systems',     'icon': '〰️'},
      {'name': 'Communication Systems', 'icon': '📡'},
      {'name': 'Microprocessors',       'icon': '🔬'},
      {'name': 'VLSI Design',           'icon': '⚡'},
    ],
    'EEE': [
      {'name': 'Power Systems',       'icon': '⚡'},
      {'name': 'Electrical Machines', 'icon': '🔧'},
      {'name': 'Control Systems',     'icon': '🎛️'},
      {'name': 'Power Electronics',   'icon': '💡'},
      {'name': 'Circuit Theory',      'icon': '🔌'},
    ],
    'ME': [
      {'name': 'Thermodynamics',    'icon': '🔥'},
      {'name': 'Fluid Mechanics',   'icon': '💧'},
      {'name': 'Manufacturing',     'icon': '🏭'},
      {'name': 'Machine Design',    'icon': '⚙️'},
      {'name': 'Heat Transfer',     'icon': '🌡️'},
    ],
    'Civil': [
      {'name': 'Structural Analysis','icon': '🏛️'},
      {'name': 'Soil Mechanics',     'icon': '🪨'},
      {'name': 'Fluid Mechanics',    'icon': '💧'},
      {'name': 'Transportation',     'icon': '🛣️'},
      {'name': 'Construction Mgmt',  'icon': '🏗️'},
    ],
  };

  // ── Topics per subject ────────────────────────────────────────────
  static const Map<String, List<String>> topics = {
    'Data Structures': [
      'Arrays & Strings', 'Linked Lists', 'Stacks & Queues',
      'Trees & Binary Trees', 'Graphs', 'Hashing', 'Heaps & Priority Queue',
    ],
    'Algorithms': [
      'Sorting Algorithms', 'Searching Algorithms', 'Dynamic Programming',
      'Greedy Algorithms', 'Backtracking', 'Divide & Conquer', 'Graph Algorithms',
    ],
    'DBMS': [
      'ER Model & Normalization', 'SQL Queries', 'Transactions & ACID',
      'Indexing & B-Trees', 'Joins & Views', 'NoSQL vs SQL', 'Concurrency Control',
    ],
    'Operating Systems': [
      'Process Management', 'CPU Scheduling', 'Memory Management',
      'Deadlock', 'File Systems', 'Synchronization', 'Virtual Memory',
    ],
    'Computer Networks': [
      'OSI Model', 'TCP/IP', 'HTTP & DNS', 'Routing Algorithms',
      'Subnetting', 'Socket Programming', 'Network Security',
    ],
    'OOPs': [
      'Encapsulation & Abstraction', 'Inheritance', 'Polymorphism',
      'Interface vs Abstract Class', 'Design Patterns', 'SOLID Principles', 'Exception Handling',
    ],
    'System Design': [
      'Scalability & Load Balancing', 'Caching Strategies', 'Database Design',
      'Microservices', 'Message Queues', 'CAP Theorem', 'Design URL Shortener',
    ],
    'Web Technologies': [
      'HTML & CSS Basics', 'JavaScript Fundamentals', 'REST APIs',
      'React/Angular Basics', 'Node.js', 'HTTP Protocol', 'Web Security',
    ],
    'Cloud Computing': [
      'AWS Fundamentals', 'Cloud Service Models', 'Virtualization',
      'Docker & Containers', 'Kubernetes Basics', 'Serverless', 'Cloud Storage',
    ],
    'Cybersecurity': [
      'Encryption & Cryptography', 'Network Security', 'Authentication',
      'SQL Injection', 'XSS Attacks', 'Firewalls & IDS', 'Ethical Hacking Basics',
    ],
    'Digital Electronics': [
      'Logic Gates', 'Boolean Algebra', 'Combinational Circuits',
      'Sequential Circuits', 'Flip Flops', 'Counters & Registers', 'ADC & DAC',
    ],
    'Analog Electronics': [
      'Diodes & Transistors', 'Amplifiers', 'Op-Amps',
      'Oscillators', 'Filters', 'Power Supplies', 'BJT vs FET',
    ],
    'Signals & Systems': [
      'Fourier Transform', 'Laplace Transform', 'Z-Transform',
      'Convolution', 'LTI Systems', 'Sampling Theorem', 'Signal Types',
    ],
    'Communication Systems': [
      'AM & FM Modulation', 'Digital Modulation', 'PCM & TDM',
      'Multiplexing', 'Noise in Communication', 'Antennas', '5G Basics',
    ],
    'Microprocessors': [
      '8085 Architecture', '8086 Architecture', 'Memory Interfacing',
      'Instruction Set', 'Interrupts', 'Microcontrollers', 'ARM Architecture',
    ],
    'VLSI Design': [
      'CMOS Technology', 'Logic Design in VLSI', 'Timing Analysis',
      'Physical Design', 'HDL Basics', 'FPGA', 'Low Power Design',
    ],
    'Power Systems': [
      'Generation & Transmission', 'Load Flow Analysis', 'Fault Analysis',
      'Protection Systems', 'Transformers', 'Power Factor', 'Smart Grid',
    ],
    'Electrical Machines': [
      'DC Motors & Generators', 'Induction Motors', 'Synchronous Machines',
      'Transformers', 'Stepper Motors', 'Speed Control', 'Starting Methods',
    ],
    'Control Systems': [
      'Transfer Functions', 'Block Diagrams', 'Stability Analysis',
      'Root Locus', 'Bode Plot', 'PID Controllers', 'State Space',
    ],
    'Power Electronics': [
      'Rectifiers', 'Inverters', 'Choppers',
      'MOSFET & IGBT', 'PWM Techniques', 'AC-DC Converters', 'UPS Systems',
    ],
    'Circuit Theory': [
      'Kirchhoff Laws', 'Thevenin & Norton', 'Superposition',
      'AC Circuits', 'Resonance', 'Two-Port Networks', 'Transient Analysis',
    ],
    'Thermodynamics': [
      'Laws of Thermodynamics', 'Carnot Cycle', 'Rankine Cycle',
      'IC Engines', 'Refrigeration', 'Heat Exchangers', 'Psychrometrics',
    ],
    'Fluid Mechanics': [
      'Fluid Properties', 'Bernoulli Equation', 'Flow through Pipes',
      'Boundary Layer', 'Turbomachinery', 'Compressible Flow', 'Hydraulic Machines',
    ],
    'Manufacturing': [
      'Casting Processes', 'Welding', 'Machining Operations',
      'Forming Processes', 'CNC Machining', 'Quality Control', 'Metrology',
    ],
    'Machine Design': [
      'Stress & Strain', 'Fatigue Analysis', 'Bolted Joints',
      'Gears & Shafts', 'Bearings', 'Springs', 'Brakes & Clutches',
    ],
    'Heat Transfer': [
      'Conduction', 'Convection', 'Radiation',
      'Heat Exchangers', 'Fins', 'Boiling & Condensation', 'Mass Transfer',
    ],
    'Structural Analysis': [
      'Beams & Columns', 'Trusses', 'Bending Moment',
      'Deflection', 'Indeterminate Structures', 'Plastic Analysis', 'Matrix Methods',
    ],
    'Soil Mechanics': [
      'Soil Classification', 'Compaction', 'Permeability',
      'Consolidation', 'Shear Strength', 'Foundation Types', 'Slope Stability',
    ],
    'Transportation': [
      'Highway Design', 'Traffic Engineering', 'Pavement Design',
      'Railway Engineering', 'Airport Engineering', 'Urban Transport', 'Traffic Signals',
    ],
    'Construction Mgmt': [
      'Project Planning', 'CPM & PERT', 'Cost Estimation',
      'Quality Management', 'Safety Management', 'Contracts', 'Resource Planning',
    ],
    'Software Engineering': [
      'SDLC Models', 'Agile & Scrum', 'Requirements Engineering',
      'Testing Strategies', 'UML Diagrams', 'Software Metrics', 'Version Control',
    ],
  };

  // ── Questions per topic (5 per topic) ────────────────────────────
  static const Map<String, List<Map<String, String>>> questions = {
    'Arrays & Strings': [
      {'q': 'What is the time complexity of accessing an element by index in an array?', 'a': 'O(1) — Arrays use contiguous memory, so direct index access is constant time.'},
      {'q': 'Explain the two-pointer technique with an example.', 'a': 'Two pointers start from both ends and move toward each other. Example: finding pair with given sum in sorted array — left pointer at 0, right at end, move based on comparison.'},
      {'q': 'What is the sliding window technique? When is it used?', 'a': 'A subarray window slides over the array maintaining a condition. Used for: max sum subarray of size k, longest substring without repeating characters. Time: O(n).'},
      {'q': 'What is the difference between a String and StringBuilder in Java?', 'a': 'String is immutable — each modification creates a new object. StringBuilder is mutable — in-place modifications. Use StringBuilder for concatenation in loops to avoid O(n²) complexity.'},
      {'q': 'How would you find the maximum subarray sum? (Kadane\'s Algorithm)', 'a': 'Kadane\'s: Keep currentMax = max(nums[i], currentMax+nums[i]), globalMax = max(globalMax, currentMax). Time O(n), Space O(1).'},
    ],
    'Linked Lists': [
      {'q': 'What is the difference between singly and doubly linked lists?', 'a': 'Singly: each node has next pointer only. Doubly: each node has both next and prev pointers. Doubly allows O(1) backward traversal but uses more memory.'},
      {'q': 'How do you detect a cycle in a linked list?', 'a': 'Floyd\'s cycle detection (slow-fast pointer): slow moves 1 step, fast moves 2 steps. If they meet, cycle exists. Time O(n), Space O(1).'},
      {'q': 'How do you reverse a linked list?', 'a': 'Iteratively: maintain prev=null, current=head. Loop: next=current.next, current.next=prev, prev=current, current=next. Return prev. Time O(n), Space O(1).'},
      {'q': 'How do you find the middle of a linked list?', 'a': 'Slow-fast pointer: slow moves 1 step, fast moves 2 steps. When fast reaches end, slow is at middle. Time O(n), Space O(1).'},
      {'q': 'What is a circular linked list? Give a use case.', 'a': 'Last node points to head instead of null. Use case: Round-robin CPU scheduling, circular buffer, multiplayer game turn management.'},
    ],
    'Stacks & Queues': [
      {'q': 'What is a Stack? What are its core operations?', 'a': 'Stack is LIFO (Last In First Out). Core ops: push(element) — O(1), pop() — O(1), peek()/top() — O(1), isEmpty() — O(1). Applications: function call stack, expression evaluation, undo operations.'},
      {'q': 'How do you implement a Queue using two Stacks?', 'a': 'Enqueue: push to stack1. Dequeue: if stack2 empty, pop all stack1 elements to stack2, then pop from stack2. Amortized O(1) per operation.'},
      {'q': 'What is a monotonic stack? Give an example.', 'a': 'Stack that maintains elements in monotonically increasing or decreasing order. Example: Next Greater Element problem — maintain decreasing stack, pop when current element is greater.'},
      {'q': 'Explain BFS using a Queue.', 'a': 'BFS: Initialize queue with start node, mark visited. Loop: dequeue node, process it, enqueue all unvisited neighbors, mark visited. Guarantees shortest path in unweighted graphs.'},
      {'q': 'What is the difference between Stack and Heap memory?', 'a': 'Stack: stores local variables, function calls. Fixed size, LIFO, faster access. Heap: dynamic memory allocation, managed by GC/programmer. Larger, slower, used for objects.'},
    ],
    'Trees & Binary Trees': [
      {'q': 'What is a Binary Search Tree? What are its time complexities?', 'a': 'BST: left child < parent < right child. Search/Insert/Delete: O(log n) average, O(n) worst case (skewed tree). Balanced BST like AVL/Red-Black gives O(log n) worst case.'},
      {'q': 'What are the three types of tree traversals?', 'a': 'Inorder (Left-Root-Right): gives sorted output for BST. Preorder (Root-Left-Right): used for tree copy. Postorder (Left-Right-Root): used for tree deletion, expression evaluation.'},
      {'q': 'What is the difference between BFS and DFS on trees?', 'a': 'BFS (level-order): uses queue, visits level by level. Good for shortest path, level-wise operations. DFS: uses stack/recursion, goes deep first. Three variants: inorder, preorder, postorder.'},
      {'q': 'What is a balanced binary tree? Name some examples.', 'a': 'Balanced: height difference between left and right subtree is at most 1. Examples: AVL Tree (strictly balanced), Red-Black Tree (approximately balanced), B-Trees (for databases).'},
      {'q': 'How do you find the height of a binary tree?', 'a': 'Recursive: height(null) = 0, height(node) = 1 + max(height(left), height(right)). Time O(n), Space O(h) where h is tree height.'},
    ],
    'Graphs': [
      {'q': 'What is the difference between BFS and DFS in graphs?', 'a': 'BFS: level-wise, uses queue, finds shortest path in unweighted graphs, O(V+E). DFS: depth-wise, uses stack/recursion, detects cycles, topological sort, O(V+E).'},
      {'q': 'What is Dijkstra\'s algorithm? What is its time complexity?', 'a': 'Finds shortest path from source to all vertices in weighted graph (non-negative weights). Uses min-heap/priority queue. Time: O((V+E)logV) with binary heap.'},
      {'q': 'What is a topological sort? When can it be applied?', 'a': 'Linear ordering of vertices such that for every directed edge u→v, u comes before v. Only applicable to DAGs (Directed Acyclic Graphs). Used in build systems, task scheduling.'},
      {'q': 'What is the difference between Prim\'s and Kruskal\'s algorithm?', 'a': 'Both find Minimum Spanning Tree. Prim\'s: starts from vertex, greedily adds minimum edge (good for dense graphs). Kruskal\'s: sorts all edges, adds if no cycle using Union-Find (good for sparse graphs).'},
      {'q': 'Explain Union-Find data structure.', 'a': 'Tracks connected components. Operations: find(x) — finds root of x, union(x,y) — merges components. Path compression + union by rank gives nearly O(1) amortized per operation.'},
    ],
    'Dynamic Programming': [
      {'q': 'What is Dynamic Programming? How is it different from recursion?', 'a': 'DP solves problems by breaking into overlapping subproblems and storing results (memoization/tabulation). Unlike plain recursion, avoids recomputing same subproblems. Reduces exponential time to polynomial.'},
      {'q': 'Explain the Fibonacci sequence using DP.', 'a': 'Naive recursion: O(2^n). DP memoization: store fib[n] once computed, O(n) time, O(n) space. Bottom-up tabulation: fill fib[0..n] iteratively, O(n) time, O(n) space. Space optimized: O(1) space.'},
      {'q': 'What is the 0/1 Knapsack problem?', 'a': 'Given weights & values of n items, maximize value in knapsack of capacity W. Each item can be taken or not (0/1). DP solution: dp[i][w] = max value using first i items with capacity w. Time O(nW), Space O(nW).'},
      {'q': 'Explain Longest Common Subsequence (LCS).', 'a': 'Find longest subsequence present in both strings. dp[i][j] = LCS of s1[0..i] and s2[0..j]. If s1[i]==s2[j]: dp[i][j]=dp[i-1][j-1]+1, else max(dp[i-1][j], dp[i][j-1]). Time O(mn).'},
      {'q': 'What is the difference between top-down and bottom-up DP?', 'a': 'Top-down (memoization): recursive with cache, only computes needed states. Bottom-up (tabulation): iterative, fills all states. Bottom-up usually faster (no recursion overhead), top-down easier to code.'},
    ],
    'ACID Properties': [
      {'q': 'What does ACID stand for in databases?', 'a': 'Atomicity: transaction all-or-nothing. Consistency: database goes from valid to valid state. Isolation: concurrent transactions appear sequential. Durability: committed transactions persist even after crash.'},
    ],
    'SQL Queries': [
      {'q': 'What is the difference between WHERE and HAVING clauses?', 'a': 'WHERE filters rows BEFORE grouping — works on individual rows, cannot use aggregate functions. HAVING filters AFTER GROUP BY — works on groups, can use aggregate functions like COUNT, SUM, AVG.'},
      {'q': 'Explain different types of JOINs in SQL.', 'a': 'INNER JOIN: only matching rows from both tables. LEFT JOIN: all left rows + matching right (NULL if no match). RIGHT JOIN: all right rows + matching left. FULL OUTER JOIN: all rows from both tables.'},
      {'q': 'What is a subquery? When would you use it?', 'a': 'A query nested inside another query. Used when result of one query is needed as condition for another. Types: correlated (references outer query) and non-correlated (independent). Alternative: JOINs are often more efficient.'},
    ],
    'ER Model & Normalization': [
      {'q': 'What are the different normal forms in database normalization?', 'a': '1NF: atomic values, no repeating groups. 2NF: 1NF + no partial dependency on composite key. 3NF: 2NF + no transitive dependency. BCNF: every determinant is candidate key. Higher NFs reduce redundancy.'},
      {'q': 'What is the difference between primary key, foreign key, and candidate key?', 'a': 'Primary key: uniquely identifies each row, NOT NULL. Foreign key: references primary key of another table, maintains referential integrity. Candidate key: any column/combo that could be primary key — primary key is chosen from candidates.'},
    ],
    'Process Management': [
      {'q': 'What is the difference between a process and a thread?', 'a': 'Process: independent program in execution, has its own memory space, PCB, resources. Heavy to create. Thread: lightweight unit within a process, shares memory with other threads of same process. Context switching faster for threads.'},
      {'q': 'What are the different states of a process?', 'a': 'New → Ready → Running → (Waiting/Blocked) → Terminated. New: being created. Ready: waiting for CPU. Running: executing. Waiting: blocked on I/O or event. Terminated: finished execution.'},
    ],
    'CPU Scheduling': [
      {'q': 'Compare FCFS, SJF, and Round Robin scheduling.', 'a': 'FCFS: first come first served, simple but convoy effect. SJF: shortest job first, minimum avg waiting time but starvation possible. Round Robin: time quantum, fair, good for time-sharing. Priority: can cause starvation, solved by aging.'},
    ],
    'Deadlock': [
      {'q': 'What are the four conditions for deadlock? (Coffman conditions)', 'a': 'Mutual Exclusion: resource held by only one process. Hold & Wait: process holds resource while waiting for another. No Preemption: resource can\'t be forcibly taken. Circular Wait: circular chain of processes waiting. All four must hold for deadlock.'},
      {'q': 'What is the Banker\'s Algorithm?', 'a': 'Deadlock avoidance algorithm. Simulates resource allocation to check if system stays in safe state. Maintains: Available, Max, Allocation, Need matrices. Grants request only if resulting state is safe. Named after bank loan analogy.'},
    ],
    'OSI Model': [
      {'q': 'Name and explain the 7 layers of the OSI model.', 'a': 'Physical (1): bits transmission. Data Link (2): MAC, framing, error detection. Network (3): IP, routing. Transport (4): TCP/UDP, end-to-end. Session (5): connection management. Presentation (6): encryption, compression. Application (7): HTTP, FTP, DNS.'},
    ],
    'TCP/IP': [
      {'q': 'What is the TCP 3-way handshake?', 'a': 'Connection establishment: (1) Client sends SYN to server. (2) Server responds SYN-ACK. (3) Client sends ACK. Connection established. For closing: 4-way handshake (FIN, ACK, FIN, ACK).'},
      {'q': 'What is the difference between TCP and UDP?', 'a': 'TCP: connection-oriented, reliable, ordered delivery, flow control, congestion control. Slower. Used: HTTP, FTP, email. UDP: connectionless, unreliable, no ordering, fast, no overhead. Used: video streaming, DNS, gaming.'},
    ],
    'Encapsulation & Abstraction': [
      {'q': 'What is encapsulation? How is it implemented in Java?', 'a': 'Encapsulation: binding data and methods together, hiding internal state. Implemented via: private fields, public getters/setters. Benefits: data hiding, validation in setters, loose coupling, easier maintenance.'},
      {'q': 'What is abstraction? Difference between abstract class and interface?', 'a': 'Abstraction: hiding implementation, showing only essential features. Abstract class: can have concrete methods, constructors, state. Interface: all methods abstract (Java 7), can have default methods (Java 8+). Class can implement multiple interfaces but extend only one class.'},
    ],
    'Inheritance': [
      {'q': 'What is the difference between IS-A and HAS-A relationships?', 'a': 'IS-A (Inheritance): Dog extends Animal — Dog IS-A Animal. HAS-A (Composition): Car HAS-A Engine. Prefer composition over inheritance when possible — more flexible, avoids deep inheritance hierarchies, easier to test.'},
    ],
    'Polymorphism': [
      {'q': 'What is the difference between method overloading and overriding?', 'a': 'Overloading (compile-time): same method name, different parameters, same class. Resolved at compile time. Overriding (runtime): same signature in parent and child class. Resolved at runtime via dynamic dispatch. @Override annotation in Java.'},
    ],
    'Logic Gates': [
      {'q': 'What is a universal gate? Why are NAND and NOR universal?', 'a': 'A universal gate can implement any Boolean function. NAND and NOR are universal because any other gate (AND, OR, NOT, XOR) can be constructed using only NAND or only NOR gates. This simplifies chip manufacturing.'},
      {'q': 'What is the difference between combinational and sequential circuits?', 'a': 'Combinational: output depends only on current inputs (no memory). Examples: Adder, Mux, Decoder. Sequential: output depends on current inputs AND past states (has memory/flip-flops). Examples: Registers, Counters, FSMs.'},
    ],
    'Fourier Transform': [
      {'q': 'What is the Fourier Transform and what is it used for?', 'a': 'Transforms signal from time domain to frequency domain. Shows which frequencies are present in a signal. Applications: signal processing, image compression (JPEG uses DCT), audio analysis, filtering. DFT for discrete signals, FFT is fast algorithm for DFT.'},
    ],
    'AM & FM Modulation': [
      {'q': 'What is the difference between AM and FM modulation?', 'a': 'AM (Amplitude Modulation): carrier amplitude varies with message signal. Simple, susceptible to noise. FM (Frequency Modulation): carrier frequency varies. Better noise immunity, higher bandwidth. FM used for music (88-108 MHz), AM for talk radio.'},
    ],
    'Laws of Thermodynamics': [
      {'q': 'State all four laws of thermodynamics.', 'a': 'Zeroth: if A and B are in thermal equilibrium with C, then A and B are in equilibrium with each other. First: energy cannot be created or destroyed (ΔU = Q - W). Second: entropy of isolated system never decreases. Third: entropy approaches constant as temp → 0K.'},
    ],
    'Bernoulli Equation': [
      {'q': 'State Bernoulli\'s equation and its assumptions.', 'a': 'P + ½ρv² + ρgh = constant along streamline. Assumptions: steady flow, incompressible fluid, inviscid (no viscosity), flow along streamline. Applications: aircraft lift, Venturi meter, Pitot tube.'},
    ],
    'Beams & Columns': [
      {'q': 'What is the difference between a simply supported beam and a cantilever beam?', 'a': 'Simply supported: supported at both ends, free to rotate but not translate. Reactions: vertical forces at both ends. Cantilever: fixed at one end, free at other. Fixed end has moment reaction. Cantilever has max bending moment at fixed end.'},
    ],
    'Soil Classification': [
      {'q': 'What is the Unified Soil Classification System (USCS)?', 'a': 'Classifies soil based on grain size and plasticity. Coarse-grained (>50% retained on #200 sieve): Gravel (G) or Sand (S). Fine-grained (<50%): Silt (M), Clay (C), Organic (O). Subdivided by gradation and plasticity characteristics.'},
    ],
  };

  // ── Get questions for a topic ─────────────────────────────────────
  static List<Map<String, String>> getQuestions(String topic) {
    return questions[topic] ?? _defaultQuestions(topic);
  }

  // ── Coding Problems per topic ─────────────────────────────────────
  static const Map<String, Map<String, String>> _codingProblems = {
    'Arrays & Strings': {
      'title': 'Maximum Subarray Sum',
      'problem': 'Given an integer array nums, find the contiguous subarray with the largest sum and return its sum.\n\nExample:\nInput: [-2, 1, -3, 4, -1, 2, 1, -5, 4]\nOutput: 6\nExplanation: [4,-1,2,1] has the largest sum = 6',
      'approach': 'Use Kadane\'s Algorithm:\n1. Initialize currentMax = nums[0], globalMax = nums[0]\n2. For each element from index 1:\n   currentMax = max(nums[i], currentMax + nums[i])\n   globalMax = max(globalMax, currentMax)\n3. Return globalMax\n\nTime: O(n) | Space: O(1)',
      'code': '''int maxSubArray(List<int> nums) {
  int currentMax = nums[0];
  int globalMax  = nums[0];
  
  for (int i = 1; i < nums.length; i++) {
    currentMax = nums[i] > currentMax + nums[i]
        ? nums[i]
        : currentMax + nums[i];
    if (currentMax > globalMax) globalMax = currentMax;
  }
  return globalMax;
}''',
      'tip': '💡 Key insight: If currentMax becomes negative, start fresh from current element.',
    },
    'Linked Lists': {
      'title': 'Reverse a Linked List',
      'problem': 'Given the head of a singly linked list, reverse the list and return the reversed list.\n\nExample:\nInput:  1 → 2 → 3 → 4 → 5\nOutput: 5 → 4 → 3 → 2 → 1',
      'approach': 'Iterative approach:\n1. Keep three pointers: prev=null, current=head, next\n2. While current != null:\n   Save next = current.next\n   Reverse: current.next = prev\n   Move: prev=current, current=next\n3. Return prev (new head)\n\nTime: O(n) | Space: O(1)',
      'code': '''ListNode? reverseList(ListNode? head) {
  ListNode? prev    = null;
  ListNode? current = head;
  
  while (current != null) {
    ListNode? next  = current.next;
    current.next    = prev;
    prev            = current;
    current         = next;
  }
  return prev; // new head
}''',
      'tip': '💡 Draw it out: each arrow just flips direction. prev tracks the new chain.',
    },
    'Stacks & Queues': {
      'title': 'Valid Parentheses',
      'problem': 'Given a string s containing just ( ) { } [ ], determine if the input string is valid.\n\nExample:\nInput:  "({[]})" → true\nInput:  "({)]"  → false',
      'approach': 'Use a Stack:\n1. For each character:\n   - If opening bracket → push to stack\n   - If closing bracket → check if stack top matches\n   - If mismatch or stack empty → return false\n2. Return stack.isEmpty at end\n\nTime: O(n) | Space: O(n)',
      'code': '''bool isValid(String s) {
  final stack = <String>[];
  final map   = {')': '(', '}': '{', ']': '['};
  
  for (final ch in s.split('')) {
    if ('([{'.contains(ch)) {
      stack.add(ch);
    } else {
      if (stack.isEmpty || stack.last != map[ch]) {
        return false;
      }
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}''',
      'tip': '💡 Stack perfectly models LIFO — last opened bracket must be first closed.',
    },
    'Trees & Binary Trees': {
      'title': 'Maximum Depth of Binary Tree',
      'problem': 'Given the root of a binary tree, return its maximum depth.\n\nMaximum depth = number of nodes along the longest path from root to the farthest leaf.\n\nExample:\n    3\n   / \\\n  9  20\n    /  \\\n   15   7\nOutput: 3',
      'approach': 'Recursive DFS:\n1. Base case: if node == null, return 0\n2. Recursively find depth of left and right subtrees\n3. Return 1 + max(leftDepth, rightDepth)\n\nTime: O(n) | Space: O(h) where h = height',
      'code': '''int maxDepth(TreeNode? root) {
  if (root == null) return 0;
  
  int leftDepth  = maxDepth(root.left);
  int rightDepth = maxDepth(root.right);
  
  return 1 + (leftDepth > rightDepth 
      ? leftDepth 
      : rightDepth);
}''',
      'tip': '💡 Think of it as: depth of tree = 1 + depth of taller subtree.',
    },
    'Graphs': {
      'title': 'Number of Islands (BFS)',
      'problem': 'Given an m×n 2D binary grid of "1"s (land) and "0"s (water), return the number of islands.\n\nExample:\nInput:\n  1 1 0 0 0\n  1 1 0 0 0\n  0 0 1 0 0\n  0 0 0 1 1\nOutput: 3',
      'approach': 'BFS/DFS approach:\n1. Iterate through each cell\n2. When you find "1" (land), increment count\n3. BFS/DFS to mark all connected land as visited ("0")\n4. Continue until all cells visited\n\nTime: O(m×n) | Space: O(min(m,n))',
      'code': '''int numIslands(List<List<String>> grid) {
  int count = 0;
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if (grid[i][j] == '1') {
        count++;
        _bfs(grid, i, j);
      }
    }
  }
  return count;
}

void _bfs(List<List<String>> g, int r, int c) {
  final queue = [[r, c]];
  g[r][c] = '0';
  const dirs = [[0,1],[0,-1],[1,0],[-1,0]];
  while (queue.isNotEmpty) {
    final pos = queue.removeAt(0);
    for (final d in dirs) {
      int nr = pos[0]+d[0], nc = pos[1]+d[1];
      if (nr>=0 && nr<g.length && nc>=0 && 
          nc<g[0].length && g[nr][nc]=='1') {
        g[nr][nc] = '0';
        queue.add([nr, nc]);
      }
    }
  }
}''',
      'tip': '💡 Classic BFS flood-fill. Mark visited by changing "1" to "0" in-place.',
    },
    'Dynamic Programming': {
      'title': 'Climbing Stairs',
      'problem': 'You are climbing a staircase with n steps. You can climb 1 or 2 steps at a time. In how many distinct ways can you climb to the top?\n\nExample:\nInput: n = 5\nOutput: 8\n(1+1+1+1+1, 1+1+1+2, 1+1+2+1, 1+2+1+1, 2+1+1+1, 1+2+2, 2+1+2, 2+2+1)',
      'approach': 'DP (Fibonacci pattern):\n1. dp[1] = 1, dp[2] = 2\n2. dp[i] = dp[i-1] + dp[i-2]\n   (reach step i from i-1 or i-2)\n3. Optimize to O(1) space using two variables\n\nTime: O(n) | Space: O(1)',
      'code': '''int climbStairs(int n) {
  if (n <= 2) return n;
  
  int prev2 = 1; // ways to reach step 1
  int prev1 = 2; // ways to reach step 2
  
  for (int i = 3; i <= n; i++) {
    int current = prev1 + prev2;
    prev2 = prev1;
    prev1 = current;
  }
  return prev1;
}''',
      'tip': '💡 This IS Fibonacci! To reach step n, you came from n-1 or n-2.',
    },
    'Sorting Algorithms': {
      'title': 'Sort an Array (Merge Sort)',
      'problem': 'Implement Merge Sort to sort an integer array in ascending order.\n\nExample:\nInput:  [5, 2, 4, 6, 1, 3]\nOutput: [1, 2, 3, 4, 5, 6]',
      'approach': 'Divide & Conquer:\n1. If array length <= 1, return as is\n2. Split array into two halves\n3. Recursively sort each half\n4. Merge two sorted halves\n\nMerge: compare front elements of both arrays, pick smaller\n\nTime: O(n log n) | Space: O(n)',
      'code': '''List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) return arr;
  
  int mid = arr.length ~/ 2;
  List<int> left  = mergeSort(arr.sublist(0, mid));
  List<int> right = mergeSort(arr.sublist(mid));
  
  return merge(left, right);
}

List<int> merge(List<int> l, List<int> r) {
  List<int> result = [];
  int i = 0, j = 0;
  while (i < l.length && j < r.length) {
    if (l[i] <= r[j]) result.add(l[i++]);
    else               result.add(r[j++]);
  }
  result.addAll(l.sublist(i));
  result.addAll(r.sublist(j));
  return result;
}''',
      'tip': '💡 Merge Sort is stable and guaranteed O(n log n) — great for linked lists too.',
    },
    'Hashing': {
      'title': 'Two Sum',
      'problem': 'Given an array of integers nums and an integer target, return indices of the two numbers that add up to target.\n\nExample:\nInput: nums=[2,7,11,15], target=9\nOutput: [0, 1]\n(nums[0] + nums[1] = 2 + 7 = 9)',
      'approach': 'HashMap approach:\n1. Create empty HashMap: value → index\n2. For each number:\n   complement = target - nums[i]\n   If complement in map → return [map[complement], i]\n   Else → add nums[i] to map\n\nTime: O(n) | Space: O(n)',
      'code': '''List<int> twoSum(List<int> nums, int target) {
  Map<int, int> seen = {}; // value → index
  
  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    
    if (seen.containsKey(complement)) {
      return [seen[complement]!, i];
    }
    seen[nums[i]] = i;
  }
  return []; // no solution
}''',
      'tip': '💡 HashMap turns O(n²) brute force into O(n). Always think: "What can I store to avoid re-scanning?"',
    },
  };

  // ── Get coding problem for a topic ────────────────────────────────
  static Map<String, String> getCodingProblem(String topic) {
    return _codingProblems[topic] ?? {
      'title': '$topic — Practice Problem',
      'problem': 'Given the concepts of $topic, solve the following:\n\nDesign an efficient algorithm that demonstrates the core principles of $topic. Consider edge cases and optimize for both time and space complexity.',
      'approach': 'General approach for $topic problems:\n1. Understand the problem constraints\n2. Identify the right data structure\n3. Think about edge cases\n4. Start with brute force, then optimize\n5. Analyze time and space complexity',
      'code': '''// $topic Solution Template
// TODO: Implement your solution here

void solve() {
  // 1. Parse input
  // 2. Apply $topic technique  
  // 3. Return result
  
  // Time Complexity:  O(?)
  // Space Complexity: O(?)
}''',
      'tip': '💡 For $topic problems: always clarify constraints, think about edge cases first!',
    };
  }

  static List<Map<String, String>> _defaultQuestions(String topic) {
    return [
      {'q': 'What is $topic? Define it clearly.', 'a': 'Provide a clear, concise definition covering the fundamental concepts and importance of $topic in engineering.'},
      {'q': 'What are the key applications of $topic?', 'a': '$topic has wide applications in industry and research. Key applications include real-world engineering solutions and practical implementations.'},
      {'q': 'What are the main formulas/principles in $topic?', 'a': 'The fundamental principles of $topic include core mathematical relationships and governing equations used in analysis.'},
      {'q': 'Compare two important concepts within $topic.', 'a': 'When comparing key concepts in $topic, consider differences in methodology, application, advantages, and limitations.'},
      {'q': 'What are common interview questions about $topic?', 'a': 'Interviewers typically ask about definitions, applications, problem-solving approaches, and real-world examples related to $topic.'},
    ];
  }

  // ── Mock Interview Questions ──────────────────────────────────────
  static const List<Map<String, String>> mockQuestions = [
    {
      'q': 'Tell me about yourself and your technical background.',
      'a': 'Cover: education, key skills, projects, what excites you technically, and why you\'re interested in this role.',
      'hint': 'Keep it 2 minutes: Education → Skills → Projects → Goal',
    },
    {
      'q': 'What is your strongest technical skill and how did you develop it?',
      'a': 'Choose one skill, explain how you learned it, projects where you applied it, and how you continued improving.',
      'hint': 'Give a specific project example where you used this skill',
    },
    {
      'q': 'Describe a challenging technical problem you solved.',
      'a': 'Use STAR: Situation, Task, Action, Result. Focus on your specific contribution and what you learned.',
      'hint': 'Use STAR format: Situation → Task → Action → Result',
    },
    {
      'q': 'Explain the difference between Array and LinkedList. When would you use each?',
      'a': 'Array: O(1) access, fixed size, cache friendly. LinkedList: O(n) access, dynamic size, O(1) insert/delete. Use array for random access, LinkedList for frequent insertions.',
      'hint': 'Think about time complexity for access, insert, delete',
    },
    {
      'q': 'What is Object Oriented Programming? Explain its 4 pillars.',
      'a': 'OOP models real-world entities. 4 pillars: Encapsulation (data hiding), Inheritance (reuse), Polymorphism (many forms), Abstraction (hide complexity).',
      'hint': 'Give a real-life analogy for each pillar',
    },
    {
      'q': 'What is the difference between a process and a thread?',
      'a': 'Process: independent program, own memory space, heavy. Thread: lightweight, shares memory with parent process. Context switching faster for threads.',
      'hint': 'Think about memory sharing and creation overhead',
    },
    {
      'q': 'Explain SQL JOIN types with examples.',
      'a': 'INNER JOIN: only matching rows. LEFT JOIN: all left + matching right. RIGHT JOIN: all right + matching left. FULL OUTER JOIN: all rows from both tables.',
      'hint': 'Draw a Venn diagram in your mind — overlapping vs non-overlapping',
    },
    {
      'q': 'What is the time complexity of Quick Sort and when does worst case occur?',
      'a': 'Average: O(n log n), Worst: O(n²) when pivot is always smallest/largest element (sorted array with bad pivot). Use random pivot or median-of-3 to avoid worst case.',
      'hint': 'Think about pivot selection and its effect on partitioning',
    },
    {
      'q': 'How do you approach debugging a complex issue?',
      'a': 'Systematic approach: reproduce the issue, isolate the cause, examine logs, use debugging tools, test fixes, document solution.',
      'hint': 'Mention specific tools: breakpoints, logs, binary search in code',
    },
    {
      'q': 'Where do you see yourself in 5 years?',
      'a': 'Balance ambition with realism: technical growth path, leadership potential, continuous learning mindset.',
      'hint': 'Show ambition + learning mindset + alignment with company growth',
    },
  ];

  // ── HR Questions ──────────────────────────────────────────────────
  static const List<Map<String, String>> hrQuestions = [
    {
      'q': 'What is your greatest strength?',
      'a': 'Choose a relevant strength with a concrete example. Tie it to the job requirements.',
      'tip': 'Pick 1-2 strengths relevant to the role. Use a real example: "My strength is problem-solving — in my final year project, I optimized our algorithm reducing time complexity from O(n²) to O(n log n)."',
    },
    {
      'q': 'What is your greatest weakness?',
      'a': 'Be genuine, show self-awareness, and emphasize steps you are taking to improve.',
      'tip': 'Pick a real weakness but show improvement: "I used to struggle with time management, so I started using Notion to track tasks. Now I consistently meet deadlines."',
    },
    {
      'q': 'Why do you want to work at our company?',
      'a': 'Research the company. Mention specific things: culture, products, growth opportunities, mission alignment.',
      'tip': 'Always research before interview! Mention 2-3 specific things: their product, tech stack, culture, or recent news. Show genuine interest.',
    },
    {
      'q': 'Tell me about yourself.',
      'a': 'Cover: education, key skills, notable projects, and why you are interested in this role. Keep it to 2 minutes.',
      'tip': 'Use this structure: "I am a [year] B.Tech [branch] student from [college]. I have worked on [2-3 projects]. I am skilled in [technologies]. I am excited about this role because..."',
    },
    {
      'q': 'Describe a time you worked in a team.',
      'a': 'Use STAR method. Show collaboration, communication, conflict resolution if applicable.',
      'tip': 'STAR: Situation → Task → Action → Result. "In my college project team of 4, I took responsibility for the backend API. When disagreements arose, I suggested dividing tasks by expertise, resulting in on-time delivery."',
    },
    {
      'q': 'Where do you see yourself in 5 years?',
      'a': 'Balance ambition with realism. Show growth mindset and alignment with the company.',
      'tip': 'Show ambition but stay realistic: "In 5 years, I see myself as a senior developer leading technical decisions. I want to grow with this company and contribute to meaningful products."',
    },
    {
      'q': 'Why should we hire you?',
      'a': 'Highlight your unique combination of skills, projects, and attitude that match the job requirements.',
      'tip': 'Connect your skills directly to their needs: "I bring strong DSA skills, hands-on Flutter experience from my interview prep app project, and a quick learning attitude. I can contribute from day one."',
    },
    {
      'q': 'Describe a challenging situation and how you handled it.',
      'a': 'Use STAR format. Focus on your specific actions and the positive outcome.',
      'tip': 'Pick a real academic or project challenge. Show problem-solving: "Our app was crashing due to a memory leak. I used Flutter DevTools to profile it, identified the issue in a stream controller, and fixed it in 2 hours."',
    },
    {
      'q': 'What are your salary expectations?',
      'a': 'Research market rates for fresher roles. Give a range based on skills and location.',
      'tip': 'For freshers: "Based on my research and skills, I am expecting between X to Y LPA. I am open to discussion based on the role and growth opportunities."',
    },
    {
      'q': 'Do you have any questions for us?',
      'a': 'Always prepare 2-3 thoughtful questions about the role, team, growth opportunities, or company direction.',
      'tip': 'Always ask something! Good questions: "What does the onboarding process look like?" or "What technologies does the team currently use?" or "What are growth opportunities for this role?"',
    },
  ];
}
