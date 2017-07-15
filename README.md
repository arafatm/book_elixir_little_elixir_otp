# The Little Elixir & OTP Guidebook

## Chapter 3. Processes 101

### 3.1. Actor concurrency model

- Each actor is a **process**.
- Each process performs a specific task.
- To tell a process to do something, you need to send it a message. The process can reply by sending back another message.
- The kinds of messages the process can act on are specific to the process itself. In other words, messages are pattern-matched.
- Other than that, processes **don’t share any information** with other processes.

### 3.2. Naive: Building a weather application

                               Weather API

                                ^     |
                                |     |
                                |     v

    1. Request "Singapore --> Weather Actor --> 2. Response {:ok, 28C}


Create a new app
- :shipit: [# mix new metex](https://github.com/arafatm/book_elixir_little_elixir_otp/commit/ea58302)
- :shipit: [add deps httpoison and json](https://github.com/arafatm/book_elixir_little_elixir_otp/commit/3d964b9)
- :shipit: [# mix deps get](https://github.com/arafatm/book_elixir_little_elixir_otp/commit/da8db83)

### 3.3. The worker

:shipit: [Import OpenWeather API](https://github.com/arafatm/book_elixir_little_elixir_otp/commit/8d1a634)

### 3.4. Creating processes for concurrency
####  Receiving messages
####  Sending messages
### 3.5. Collecting and manipulating results with another actor
####  {:ok, result}—the happy path message
####  :exit—the poison-pill message
####  Other messages
####  The bigger picture
### 3.6. Exercises
### 3.7. Summary
## Chapter 4. Writing server applications with GenServer
### 4.1. What is OTP?
### 4.2. OTP behaviors
####  The different OTP behaviors
### 4.3. Hands-on OTP: revisiting Metex
####  Creating a new project
####  Making the worker GenServer compliant
####  Callbacks
####  Reflecting on chapter 3’s Metex
### 4.4. Exercise
### 4.5. Summary
## Chapter 5. Concurrent error-handling and fault tolerance with links, monitors, and processes
### 5.1. Links: ‘til death do us part
####  Linking processes together
####  Chain reaction of exit signals
####  Setting up the ring
####  Trapping exits
####  Linking a terminated/nonexistent process
####  spawn_link/3: spawning and linking in one atomic step
####  Exit messages
####  Ring, revisited
### 5.2. Monitors
####  Monitoring a terminated/nonexistent process
### 5.3. Implementing a supervisor
####  Supervisor API
####  Building your own supervisor
####  start_link(child_spec_list)
####  Handling crashes
####  Full supervisor source
### 5.4. A sample run (or, “Does it really work?”)
### 5.5. Summary
## Chapter 6. Fault tolerance with Supervisors
### 6.1. Implementing Pooly: a worker-pool application
####  The plan
####  A sample run of Pooly
####  Diving into Pooly, version 1: laying the groundwork
### 6.2. Implementing the worker Supervisor
####  Initializing the Supervisor
####  Supervision options
####  Restart strategies
####  max_restarts and max_seconds
####  Defining children
### 6.3. Implementing the server: the brains of the operation
####  Pool configuration
####  Validating the pool configuration
####  Starting the worker Supervisor
####  Prepopulating the worker Supervisor with workers
####  Creating a new worker process
####  Checking out a worker
####  Checking in a worker
####  Getting the pool’s status
### 6.4. Implementing the top-level Supervisor
### 6.5. Making Pooly an OTP application
### 6.6. Taking Pooly for a spin
### 6.7. Exercises
### 6.8. Summary
## Chapter 7. Completing the worker-pool application
### 7.1. Version 3: error handling, multiple pools, and multiple workers
####  Case 1: crashes between the server and consumer process
####  Case 2: crashes between the server and worker
####  Handling multiple pools
####  Adding the application behavior to Pooly
####  Adding the top-level Supervisor
####  Adding the pools Supervisor
####  Making Pooly.Server dumber
####  Adding the pool Supervisor
####  Adding the brains for the pool
####  Adding the worker supervisor for the pool
####  Taking it for a spin
### 7.2. Version 4: implementing overflowing and queuing
####  Implementing maximum overflow
####  Handling worker check-ins
####  Handling worker exits
####  Updating status with overflow information
####  Queuing worker processes
####  Taking it for a spin
### 7.3. Exercises
### 7.4. Summary
## Chapter 8. Distribution and load balancing
### 8.1. Why distributed?
### 8.2. Distribution for load balancing
####  An overview of Blitzy, the load tester
####  Let the mayhem begin!
####  Implementing the worker process
####  Running the worker
### 8.3. Introducing Tasks
### 8.4. Onward to distribution!
####  Location transparency
####  An Elixir node
####  Creating a cluster
####  Connecting nodes
####  Node connections are transitive
### 8.5. Remotely executing functions
### 8.6. Making Blitzy distributed
####  Creating a command-line interface
####  Connecting to the nodes
####  Supervising Tasks with Tasks.Supervisor
####  Using a Task Supervisor
####  Creating the binary with mix escript.build
####  Running Blitzy!
### 8.7. Summary
## Chapter 9. Distribution and fault tolerance
### 9.1. Distribution for fault tolerance
####  An overview of the Chucky application
### 9.2. Building Chucky
####  Implementing the server
####  Implementing the Application behavior
####  Application type arguments
### 9.3. An overview of failover and takeover in Chucky
####  Step 1: determine the hostname(s) of the machine(s)
####  Step 2: create configuration files for each of the nodes
####  Step 3: fill the configuration files for each of the nodes
####  Step 4: compile Chucky on all the nodes
####  Step 5: start the distributed application
### 9.4. Failover and takeover in action
### 9.5. Connecting nodes in a LAN, cookies, and security
####  Determining the IP addresses of both machines
####  Connecting the nodes
####  Remember the cookie!
### 9.6. Summary
## Chapter 10. Dialyzer and type specifications
### 10.1. Introducing Dialyzer
### 10.2. Success typings
### 10.3. Getting started with Dialyzer
####  The persistent lookup table
####  Dialyxir
####  Building a PLT
### 10.4. Software discrepancies that Dialyzer can detect
####  Catching type errors
####  Finding incorrect use of built-in functions
####  Locating redundant code
####  Finding type errors in guard clauses
####  Tripping up Dialyzer with indirection
### 10.5. Type specifications
####  Writing typespecs
### 10.6. Writing your own types
####  Multiple return types and bodiless function clauses
####  Back to bug #5
### 10.7. Exercises
### 10.8. Summary
## Chapter 11. Property-based and concurrency testing
### 11.1. Introduction to property-based testing and QuickCheck
####  Installing QuickCheck
####  Using QuickCheck in Elixir
####  Patterns for designing properties
####  Generators
####  Built-in generators
####  Creating custom generators
####  Recursive generators
####  Summary of QuickCheck
### 11.2. Concurrency testing with Concuerror
####  Installing Concuerror
####  Setting up the project
####  Types of errors that Concuerror can detect
####  Deadlocks
####  Reading Concuerror’s output
####  Concuerror summary
### 11.3. Resources
### 11.4. Summary
### Installing Erlang and Elixir
### Getting Erlang
### Installing Elixir, method 1: package manager or prebuilt installer
### Mac OS X via Homebrew and MacPorts
### Linux (Ubuntu and Fedora)
### MS Windows
### Installing Elixir, method 2: compiling from scratch (Linux/Unix only)
### Verifying your Elixir installation
### Index
### List of Figures
### List of Tables
### List of Listings
### 
