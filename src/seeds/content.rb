# Website content — the single source of truth for every public page.
# Copy is taken from www.srinishtha.com and restructured per the
# "Ultra-Premium GTM Website Enhancement Blueprint" (15 Oct 2026).
# Run `rake db:seed` after editing; the frontend reads it via GET /api/site.
module App::Seeds
  module Content
    CAPABILITY = ->(slug) { "/capabilities/#{slug}" }
    CASE_STUDY = ->(slug) { "/work/#{slug}" }

    BLOCKS = {
      company: {
        name: 'Srinishtha Technologies',
        legalName: 'Srinishtha Technologies LLP',
        logo: '/images/logo1.png',
        founded: 2024,
        city: 'Hyderabad',
        address: 'Awfis – Prestige Phoenix, 4th Floor, 1405, Uma Nagar, Begumpet, Hyderabad – 500016',
        mapUrl: 'https://maps.google.com/?q=Awfis+Prestige+Phoenix+Begumpet+Hyderabad',
        email: 'info@srinishtha.com',
        phone: '+91 99630 99560',
        phoneHref: 'tel:+919963099560',
        responseTime: 'one business day',
        positioning: 'Srinishtha Technologies engineers enterprise software, intelligent workflow automation and AI-enabled digital platforms using a reusable technology foundation that accelerates delivery without sacrificing customization, security or scale.',
        promise: 'Complex business problems converted into dependable, scalable software.',
        narrative: 'Founded in 2024, built on more than 100 years of combined technology and business experience.'
      },

      navigation: {
        primary: [
          { label: 'Capabilities', to: '/capabilities', menu: 'capabilities' },
          { label: 'Solutions', to: '/solutions', menu: 'solutions' },
          { label: 'Industries', to: '/industries' },
          { label: 'Work', to: '/work' },
          { label: 'Products', to: '/products' },
          { label: 'Insights', to: '/insights' },
          { label: 'Company', to: '/about', menu: 'company' }
        ],
        company: [
          { label: 'About', to: '/about' },
          { label: 'Leadership', to: '/leadership' },
          { label: 'How We Work', to: '/how-we-work' },
          { label: 'Security & Engineering', to: '/security' },
          { label: 'Careers', to: '/careers' },
          { label: 'Life at Srinishtha', to: '/life' },
          { label: 'Contact', to: '/contact' }
        ],
        legal: [
          { label: 'Privacy', to: '/privacy' }
        ]
      },

      ctas: {
        global: { primary: { label: 'Discuss Your Transformation', to: '/contact' }, secondary: { label: 'Explore Our Work', to: '/work' } },
        workflow: { primary: { label: 'Assess an Automation Opportunity', to: '/contact?interest=automation' }, secondary: { label: 'See Workflow Use Cases', to: '/solutions' } },
        ai: { primary: { label: 'Explore an AI Use Case', to: '/contact?interest=ai' }, secondary: { label: 'See Applied AI Capabilities', to: CAPABILITY.('ai-intelligent-systems') } },
        modernization: { primary: { label: 'Discuss a Modernization Plan', to: '/contact?interest=modernization' }, secondary: { label: 'View Engineering Approach', to: '/security' } },
        product: { primary: { label: 'Discuss Your Product', to: '/contact?interest=product' }, secondary: { label: 'See Product Work', to: '/products' } },
        enterprise: { primary: { label: 'Discuss Your Platform', to: '/contact?interest=enterprise' }, secondary: { label: 'Explore Our Work', to: '/work' } },
        caseStudy: { primary: { label: 'Discuss a Similar Challenge', to: '/contact' }, secondary: { label: 'Explore More Work', to: '/work' } },
        careers: { primary: { label: 'Submit Your Resume', href: 'https://forms.gle/mJrUXSBki62U8MM67' }, secondary: { label: 'Life at Srinishtha', to: '/life' } },
        final: {
          question: 'Have a system or process that needs work?',
          lede: 'Tell us what you are trying to change. A senior member of our team will respond within one business day.'
        }
      },

      hero: {
        eyebrow: 'Enterprise Software • Intelligent Automation • Applied AI',
        headline: 'Technology that transforms how businesses operate.',
        lede: 'We build enterprise software, workflow automation and AI-enabled platforms for growing organisations. Our reusable engineering foundation shortens delivery while every system is still built around how your business works.',
        trustCue: 'Hyderabad • Enterprise engineering • Global delivery',
        background: '/images/office-space.jpeg'
      },

      home: {
        trustLabel: 'Trusted to build and scale platforms for',
        capabilities: { eyebrow: 'Capabilities', title: 'Four capabilities, one engineering foundation.', lede: 'Each is delivered by a senior team using the same reusable modules, so quality and speed stay consistent from project to project.', link: { label: 'All capabilities', to: '/capabilities' } },
        work: { eyebrow: 'Selected work', title: 'Platforms we have engineered.', link: { label: 'All case studies', to: '/work' } },
        ai: { link: { label: 'Applied AI', to: '/capabilities/ai-intelligent-systems' } },
        industries: { eyebrow: 'Industries', title: 'Sector experience, organised by problem.', link: { label: 'All industries', to: '/industries' } }
      },

      stats: [
        { value: '100+', label: 'Years of combined experience' },
        { value: '16', label: 'Team members' },
        { value: '12+', label: 'Platforms delivered' },
        { value: '2024', label: 'Founded in Hyderabad' }
      ],

      clients: [
        { name: "Sid's Farm", logo: '/images/sidsfarm.webp' },
        { name: 'Comfort Cool Systems' },
        { name: 'Tenju Tofu', logo: '/images/tenjutofu_logo.png' },
        { name: 'Kouno Dolls', logo: '/images/kouno_logo.png' },
        { name: 'Shankara Mutt, Tirupati', logo: '/images/hamsa-white.webp', dark: true },
        { name: 'Grameena Vidhya Jyothi Bharath', logo: '/images/gvjb_logo.png' },
        { name: 'Soham Academy', logo: '/images/soham_logo.png' },
        { name: 'Vardhaman Bank', logo: '/images/vardhaman_bank_logo.gif' },
        { name: 'Kalaguragampa', logo: '/images/kalaguragampa_logo.png' },
        { name: 'Elevate Together', logo: '/images/elevatetogether_logo.png' },
        { name: 'Sri Ramanavami', logo: '/images/sri_rama_navami_logo.png' },
        { name: 'Crave Better Foods', logo: '/images/crave_logo.png' },
        { name: 'Innomayi', logo: '/images/innomayi-logo.png' },
        { name: 'Dr. Laxminadh Sivaraju', logo: '/images/dr_laxminadh_logo.jpg' },
        { name: 'Dr. Prathusha Nerella', logo: '/images/dr_prathusha_nerella.png' }
      ],

      capabilities: [
        {
          slug: 'enterprise-software-engineering',
          title: 'Enterprise Software Engineering',
          pillar: true,
          headline: 'Enterprise software. Engineered for what comes next.',
          outcome: 'Business-critical platforms that stay fast, secure and maintainable as you scale.',
          summary: 'Complex, multi-role business applications built API-first, designed for high volume, deep integration and years of evolution.',
          cta: 'enterprise',
          items: [
            'Complex business applications and portals',
            'Multi-role / multi-tenant platforms',
            'API-first systems and integrations',
            'High-volume transactional systems',
            'Legacy replacement and modernization',
            'Data models and workflow-heavy applications',
            'Performance, observability and reliability engineering',
            'Ongoing product evolution and support'
          ],
          caseStudies: ['comfort-cool-systems', 'sids-farm', 'tirupati-shankara-mutt']
        },
        {
          slug: 'workflow-automation',
          title: 'Workflow Automation',
          pillar: true,
          headline: 'Turn complex operations into intelligent workflows.',
          outcome: 'Approvals, hand-offs and follow-ups that run themselves, with a full audit trail.',
          summary: 'We replace spreadsheets, email chains and manual approvals with rule-driven workflows that are visible, measurable and auditable.',
          cta: 'workflow',
          items: [
            'Process discovery and workflow mapping',
            'Forms and structured data capture',
            'Rules, approvals and conditional routing',
            'Task queues, escalations and SLA management',
            'Document workflows and e-sign integrations',
            'Notifications and reminders',
            'ERP/CRM/payment/API integration',
            'Audit trails and compliance evidence',
            'Operational dashboards',
            'AI-assisted classification, extraction and decision support'
          ],
          caseStudies: ['comfort-cool-systems', 'tirupati-shankara-mutt', 'education-erp']
        },
        {
          slug: 'ai-intelligent-systems',
          title: 'AI & Intelligent Systems',
          pillar: true,
          headline: 'Put AI to work inside your business.',
          outcome: 'Applied AI embedded in real workflows, grounded in your data, governed by your rules.',
          summary: 'Knowledge assistants, document intelligence and workflow copilots designed with guardrails, human review and measurable evaluation.',
          cta: 'ai',
          items: [
            'Enterprise knowledge assistants / RAG',
            'Document extraction and classification',
            'Workflow copilots and task assistance',
            'Agentic workflows with guardrails',
            'Semantic search',
            'Summarization and content intelligence',
            'Predictive / analytical use cases where appropriate',
            'Human-in-the-loop review',
            'Evaluation, monitoring, privacy and access controls',
            'Model/provider abstraction where commercially sensible'
          ],
          caseStudies: ['hospitality-supply']
        },
        {
          slug: 'digital-product-engineering',
          title: 'Digital Product Engineering',
          pillar: true,
          headline: 'From complex idea to scalable digital product.',
          outcome: 'Products that launch quickly on foundations that will not need rebuilding.',
          summary: 'Discovery, design and engineering for web and mobile products, from zero-to-one through scale-up and rescue.',
          cta: 'product',
          items: [
            'Product discovery and requirements',
            'UX/UI and design systems',
            'MVP and zero-to-one engineering',
            'Web and mobile product development',
            'Architecture and cloud foundations',
            'Analytics and experimentation',
            'Release management',
            'Scale-up, modernization and product rescue'
          ],
          caseStudies: ['crave-better', 'kouno-dolls', 'career-accelerator']
        },
        {
          slug: 'cloud-modernization',
          title: 'Cloud & Modernization',
          pillar: false,
          headline: 'Modernize without disrupting the business.',
          outcome: 'Legacy systems moved to secure, observable, cloud-ready architecture.',
          summary: 'Assessment-led modernization: we decide what to keep, what to refactor and what to replace, then migrate safely.',
          cta: 'modernization',
          items: [
            'Application assessment',
            'Architecture modernization',
            'Cloud migration',
            'Monolith decomposition where justified',
            'Database modernization',
            'DevOps / CI/CD',
            'Monitoring and observability',
            'Performance engineering',
            'Backup, disaster recovery and operational readiness'
          ],
          caseStudies: ['sids-farm']
        }
      ],

      framework: {
        eyebrow: 'Our differentiator',
        title: 'The Srinishtha Technology Framework',
        lede: 'A set of reusable modules for identity, workflow, documents, integration, audit and analytics. Projects start from these instead of from scratch, and our engineering time goes into the parts specific to each client.',
        disclaimer: 'Reusable foundations accelerate delivery; each solution is configured and engineered to the client’s requirements.',
        layers: [
          { key: 'experience', name: 'Experience', modules: ['Web', 'Mobile', 'Responsive portals', 'Dashboards', 'Admin consoles'], value: 'Consistent multi-role experiences', useCase: 'Devotee, volunteer and administrator journeys on one platform for Tirupati Shankara Mutt.' },
          { key: 'identity', name: 'Identity & Access', modules: ['Authentication', 'RBAC', 'Organization / tenant model', 'Permissions'], value: 'Secure access and governance', useCase: 'Role-based administration with head-office oversight across Mutt branches.' },
          { key: 'workflow', name: 'Workflow', modules: ['States', 'Rules', 'Approvals', 'Tasks', 'Escalations', 'SLAs'], value: 'Rapid automation of complex processes', useCase: 'Pooja booking and room reservation flows with date, slot and approval rules.' },
          { key: 'records', name: 'Records & Documents', modules: ['Forms', 'Files', 'Metadata', 'Versioning', 'Templates'], value: 'Operational data and document control', useCase: 'Automated donation receipts generated from templates.' },
          { key: 'communication', name: 'Communication', modules: ['Email', 'SMS', 'Push', 'In-app notifications', 'Reminders'], value: 'Timely action, less manual follow-up', useCase: 'Contextual updates for parents and staff in the education ERP.' },
          { key: 'integration', name: 'Integration', modules: ['APIs', 'Webhooks', 'ERP / CRM', 'Payments', 'Identity connectors'], value: 'Fits your existing ecosystem', useCase: 'Secure payment gateways for D2C commerce and donations.' },
          { key: 'audit', name: 'Audit & Compliance', modules: ['Audit trails', 'Activity history', 'Change logs', 'Consent'], value: 'Traceability and accountability', useCase: 'Centralized monitoring hooks for the Sringeri Sharada Peetham head office.' },
          { key: 'analytics', name: 'Data & Analytics', modules: ['Operational dashboards', 'Events', 'KPIs', 'Exports'], value: 'Visibility and decision support', useCase: 'Real-time visibility for school leadership in the education ERP.' },
          { key: 'ai', name: 'AI Layer', modules: ['Knowledge retrieval', 'Document intelligence', 'Copilots / agents', 'Classification'], value: 'Intelligence embedded in workflows', useCase: 'Natural-language, fuzzy-matched ordering for hospitality supply.' },
          { key: 'ops', name: 'Platform Ops', modules: ['Cloud deployment', 'CI/CD', 'Monitoring', 'Backup', 'Recovery'], value: 'Reliability and operational maturity', useCase: "Stabilizing Sid's Farm for thousands of simultaneous users." }
        ]
      },

      automationFlow: {
        eyebrow: 'Workflow automation',
        title: 'How an automated workflow runs',
        lede: 'Every workflow we build follows the same disciplined path, so operations become visible, auditable and measurable.',
        steps: [
          { title: 'Request', text: 'Structured intake through forms, portals, mobile or API, validated at the source.' },
          { title: 'Rules', text: 'Business rules route, prioritise and enrich every item automatically.' },
          { title: 'Approval', text: 'Role-based approvals with escalations and SLAs, recorded in the audit trail.' },
          { title: 'Integration', text: 'Results flow into ERP, CRM, payments and notification channels.' },
          { title: 'Analytics', text: 'Dashboards show throughput, bottlenecks and outcomes in real time.' }
        ]
      },

      appliedAi: {
        eyebrow: 'Applied AI',
        title: 'Applied AI, with people in control',
        lede: 'We put AI where it removes real effort, ground it in your data, and design every use case with review, permissions and evaluation.',
        items: [
          { title: 'Knowledge assistants', text: 'Source-grounded answers from your documents and systems, respecting user permissions.' },
          { title: 'Document intelligence', text: 'Upload, extract, validate and route documents into the right workflow.' },
          { title: 'Copilots & agents', text: 'Task assistance and agentic steps bounded by guardrails and approvals.' },
          { title: 'Analytics & prediction', text: 'Pattern detection and forecasting where the data genuinely supports it.' },
          { title: 'Human review', text: 'Confidence thresholds and review queues keep accountable people in the loop.' }
        ]
      },

      delivery: {
        eyebrow: 'How we work',
        title: 'How we deliver',
        lede: 'Senior involvement from the first conversation to long after launch, with demos, decisions and risks visible at every stage.',
        steps: [
          { title: 'Discover', text: 'Map the process, users, constraints and success measures before a line of code.' },
          { title: 'Architect', text: 'Choose framework modules, integrations and the data model; agree the release plan.' },
          { title: 'Engineer', text: 'Short iterations with regular demos, code review and automated testing.' },
          { title: 'Launch', text: 'UAT, release gates, monitored rollout and hand-over documentation.' },
          { title: 'Evolve', text: 'Support, performance tuning and a roadmap that keeps the platform moving.' }
        ]
      },

      solutions: [
        {
          slug: 'operations-automation', title: 'Operations Automation', capability: 'workflow-automation', cta: 'workflow',
          problems: ['Manual approvals', 'Spreadsheet tracking', 'Email follow-ups', 'Lack of auditability'],
          proof: 'Interactive approval workflow + dashboard',
          headline: 'Replace manual approvals with workflows you can audit.',
          lede: 'We turn the requests, approvals and hand-offs your teams chase by email into rule-driven workflows with clear ownership, SLAs and a complete history.',
          before: ['Approvals chased over email and WhatsApp', 'Status tracked in shared spreadsheets', 'No one can see where a request is stuck', 'No reliable record of who approved what'],
          after: ['Requests captured once, through structured forms', 'Rules route each item to the right approver, with SLAs', 'Live status for requesters and managers', 'A full audit trail for every decision'],
          modules: ['workflow', 'identity', 'communication', 'audit', 'analytics', 'integration'],
          caseStudies: ['comfort-cool-systems', 'tirupati-shankara-mutt']
        },
        {
          slug: 'enterprise-portals', title: 'Enterprise Portals', capability: 'enterprise-software-engineering', cta: 'enterprise',
          problems: ['Fragmented user journeys', 'Multiple stakeholder groups', 'Disconnected systems'],
          proof: 'Role-based portal UI + integration map',
          headline: 'One portal for every stakeholder, connected to the systems you run.',
          lede: 'Employees, partners and customers each get the view they need, from a single secure platform that talks to your existing ERP, CRM and finance systems.',
          before: ['A separate login for every system', 'Every stakeholder group sees the same generic screens', 'Data re-keyed between tools', 'IT maintains several disconnected applications'],
          after: ['Single sign-in with role-specific views', 'Workflows tailored to each stakeholder group', 'Integrations keep data in step automatically', 'One maintainable platform with a clear roadmap'],
          modules: ['experience', 'identity', 'integration', 'records', 'analytics'],
          caseStudies: ['comfort-cool-systems', 'tirupati-shankara-mutt']
        },
        {
          slug: 'education-platforms', title: 'Education Platforms', capability: 'digital-product-engineering', cta: 'product',
          problems: ['Admissions', 'Teacher and student workflows', 'Administration', 'Parent engagement'],
          proof: 'Student / teacher / admin flows',
          headline: 'School and education platforms people actually use.',
          lede: 'Mobile-first, multilingual platforms designed with teachers, parents, transport staff and administrators, so the system is adopted rather than avoided.',
          before: ['An ERP that exists but is barely used', 'Parents engage only when fees are due', 'Transport coordinated by phone calls', 'Back office still running on spreadsheets'],
          after: ['Role-specific views for teachers, parents, drivers and admin', 'Contextual updates parents actually read', 'Tap-friendly, offline-capable tools for staff', 'Real-time dashboards for school leadership'],
          modules: ['experience', 'identity', 'communication', 'workflow', 'analytics'],
          caseStudies: ['education-erp', 'career-accelerator']
        },
        {
          slug: 'digital-commerce', title: 'Digital Commerce', capability: 'digital-product-engineering', cta: 'product',
          problems: ['D2C experience', 'Order flows', 'Product content', 'Integrations and scale'],
          proof: 'Commerce UI + operational architecture',
          headline: 'D2C commerce you own, built to scale with you.',
          lede: 'Branded storefronts with payments, subscriptions and bulk ordering, so your brand controls the customer relationship instead of a marketplace.',
          before: ['Dependence on marketplaces that own the customer', 'Generic templates that dilute the brand', 'Orders and enquiries handled manually', 'No subscriptions or bulk ordering'],
          after: ['A storefront that carries your brand story', 'Cart, secure payments and order tracking', 'Subscriptions and bulk-order flows built in', 'A CMS your team updates without developers'],
          modules: ['experience', 'integration', 'records', 'communication', 'analytics'],
          caseStudies: ['crave-better', 'tenju-tofu', 'kouno-dolls']
        },
        {
          slug: 'knowledge-ai-assistants', title: 'Knowledge & AI Assistants', capability: 'ai-intelligent-systems', cta: 'ai',
          problems: ['Scattered knowledge', 'Slow information retrieval', 'Repetitive support'],
          proof: 'Source-grounded assistant with permissions',
          headline: 'Answers from your own knowledge, with permissions respected.',
          lede: 'Assistants grounded in your documents and systems that cite their sources, respect who is allowed to see what, and hand off to a person when they are unsure.',
          before: ['Knowledge buried in documents and inboxes', 'The same questions answered again and again', 'New staff take months to find their way', 'Generic chatbots that guess and cannot be trusted'],
          after: ['Answers grounded in your content, with sources shown', 'Access controls applied to every answer', 'Low-confidence answers routed to a person', 'Usage and quality measured over time'],
          modules: ['ai', 'identity', 'records', 'audit', 'analytics'],
          caseStudies: ['hospitality-supply']
        },
        {
          slug: 'document-workflows', title: 'Document Workflows', capability: 'workflow-automation', cta: 'workflow',
          problems: ['Manual intake', 'Extraction and validation', 'Routing and storage'],
          proof: 'Upload → extract → validate → approve',
          headline: 'From document intake to approval, without re-typing.',
          lede: 'Documents are uploaded once, key data is extracted and checked, and each file moves through review and approval with version control and a full history.',
          before: ['Documents arrive by email in every format', 'Staff re-type data into other systems', 'Files lost between people and folders', 'No version history or approval record'],
          after: ['One intake point for every document', 'AI-assisted extraction with human review', 'Validation rules catch errors early', 'Versioned storage and an audit trail'],
          modules: ['records', 'ai', 'workflow', 'audit', 'integration'],
          caseStudies: ['tirupati-shankara-mutt', 'comfort-cool-systems']
        },
        {
          slug: 'customer-partner-platforms', title: 'Customer & Partner Platforms', capability: 'enterprise-software-engineering', cta: 'enterprise',
          problems: ['Onboarding', 'Service requests', 'Status visibility', 'Communication'],
          proof: 'Journey map + self-service UI',
          headline: 'Self-service for customers, distributors and partners.',
          lede: 'Give the people you serve a secure place to onboard, raise requests and see progress, so your team spends less time on status calls.',
          before: ['Onboarding handled over email and paperwork', 'Customers phone in to ask for status updates', 'Partner information scattered across tools', 'No view of service levels'],
          after: ['Guided online onboarding', 'Requests tracked from submission to resolution', 'Automatic notifications at every step', 'Role-based access for each partner type'],
          modules: ['experience', 'identity', 'workflow', 'communication', 'integration'],
          caseStudies: ['comfort-cool-systems', 'sids-farm']
        }
      ],

      industries: [
        { slug: 'agriculture-dairy', name: 'Agriculture & Dairy', problem: 'Subscription deliveries and farm operations that must stay reliable at peak demand.', solutions: ['High-concurrency customer apps', 'Order and delivery workflows', 'Operational dashboards'], caseStudies: ['sids-farm'] },
        { slug: 'retail-commerce', name: 'Retail & Commerce', problem: 'Brands that need full control of their D2C experience, and distributors whose buyers are not tech-savvy.', solutions: ['Self-owned D2C platforms', 'Multilingual, offline-first ordering', 'Inventory and payment integration'], caseStudies: ['crave-better', 'tenju-tofu', 'kouno-dolls', 'hospitality-supply'] },
        { slug: 'education', name: 'Education & EdTech', problem: 'School systems that exist on paper but are barely adopted by teachers, parents and staff.', solutions: ['Human-centred school ERP', 'Rural education platforms', 'Professional networks for educators'], caseStudies: ['education-erp', 'career-accelerator'] },
        { slug: 'institutions', name: 'Cultural & Spiritual Institutions', problem: 'Engaging devotees and managing services digitally while preserving tradition and central oversight.', solutions: ['Booking and reservation workflows', 'Secure donations with receipts', 'Multilingual CMS and branch integration'], caseStudies: ['tirupati-shankara-mutt'] },
        { slug: 'professional-services', name: 'Professional Services & MSMEs', problem: 'Professionals who need a branded, bookable, payable presence without managing technology.', solutions: ['Portfolio platform factory', 'Booking, payments and testimonials', 'Self-service CMS'], caseStudies: ['professional-platforms'] },
        { slug: 'distribution', name: 'Distribution & Supply Chain', problem: 'Distributors running several warehouses on spreadsheets and phone calls, with no live view of stock.', solutions: ['Multi-warehouse inventory', 'Role-based distributor portals', 'Real-time stock tracking'], caseStudies: ['comfort-cool-systems'] },
        { slug: 'financial-services', name: 'Financial Services', problem: 'Institutions that need a trustworthy, accessible digital presence and secure integrations.', solutions: ['Customer-facing portals', 'API-first integration', 'Governance and audit'], caseStudies: [] }
      ],

      trust: {
        eyebrow: 'Security & engineering',
        title: 'Security and engineering practice',
        lede: 'How we protect client data, test what we ship, and keep platforms running after launch.',
        note: 'These describe our engineering practices. We state formal certifications only once they are achieved.',
        domains: [
          { title: 'Security', text: 'Secure SDLC, least-privilege access, secrets management, encryption in transit and at rest, dependency and vulnerability management.' },
          { title: 'Privacy', text: 'Data minimisation, clear retention principles and a direct contact channel for privacy requests.' },
          { title: 'Reliability', text: 'Monitoring, alerting, backups, recovery procedures and availability-aware architecture.' },
          { title: 'Quality', text: 'Code review on every change, automated tests, manual QA, regression, UAT and release gates.' },
          { title: 'Architecture', text: 'API-first and modular where appropriate, designed for scalability, integration and maintainability.' },
          { title: 'Delivery governance', text: 'Milestones, regular demos, a shared risk log, change control and a fixed decision cadence.' },
          { title: 'Support', text: 'Post-launch support, maintenance and continuous improvement with agreed response options.' },
          { title: 'Business continuity', text: 'You own your code. Source control, documentation and knowledge transfer are part of every engagement.' }
        ]
      },

      caseStudies: [
        {
          slug: 'sids-farm',
          client: "Sid's Farm",
          title: "Stabilizing and scaling Sid's Farm for thousands of simultaneous users",
          industry: 'agriculture-dairy',
          capabilities: ['enterprise-software-engineering', 'cloud-modernization'],
          image: '/images/cs2.jpg',
          screenshot: '/images/sidsfarm_site.webp',
          url: 'https://sidsfarm.com/',
          status: 'Live',
          flagship: true,
          summary: "Sid's Farm, a leading dairy products provider, needed its customer mobile application to stay stable while it rolled out critical features to a fast-growing customer base. Srinishtha stabilized the platform, shipped key features and engineered it to serve thousands of simultaneous users.",
          metric: { value: '1,000s', label: 'of simultaneous users supported' },
          challenge: "The existing mobile application faced stability and feature-implementation issues that were crucial for customer satisfaction and growth. Sid's Farm required a robust solution to handle increased traffic and provide a reliable user experience.",
          approach: [
            "Stabilize the mobile application: identified and resolved key technical issues affecting the app's performance.",
            'Roll out key features: implemented essential features that enhanced user interaction and satisfaction.',
            'Scalability enhancement: ensured the platform could handle thousands of simultaneous users without compromising performance.'
          ],
          outcome: "Sid's Farm stabilized its mobile application and now delivers a robust experience, with the platform supporting a large volume of concurrent users and seamless access to its services.",
          testimonial: 'sids-farm'
        },
        {
          slug: 'comfort-cool-systems',
          client: 'Comfort Cool Systems',
          title: 'A multi-warehouse inventory suite for an air-conditioning distributor',
          industry: 'distribution',
          capabilities: ['workflow-automation', 'enterprise-software-engineering'],
          image: '/images/comfort_cool_login.webp',
          screenshot: '/images/comfort_cool_login.webp',
          url: 'https://daikin.snst.cloud/',
          status: 'Live',
          flagship: false,
          summary: 'Comfort Cool Systems distributes Daikin air-conditioning products from three warehouses. Srinishtha built its Inventory Suite, a role-based platform that tracks stock across every hub in real time and gives distributors and staff one secure place to work.',
          metric: { value: '3', label: 'warehouses tracked in real time' },
          challenge: 'Stock was spread across three warehouses, and keeping counts, transfers and distributor requests in step relied on manual updates. The business needed live visibility of every hub and controlled access for internal teams and distributors.',
          approach: [
            'Role-based sign-in for distributors and internal staff, with secure sessions',
            'Real-time stock levels across all three warehouses',
            'Stock movements and transfers between hubs, recorded with a full history',
            'Branded operational interface built for daily, high-frequency use',
            'Built on the Srinishtha framework: identity, workflow, audit and analytics modules'
          ],
          outcome: 'Comfort Cool Systems now manages every hub from a single Inventory Suite, with real-time stock tracking and role-based access for its distributor network.'
        },
        {
          slug: 'crave-better',
          client: 'Crave Better Foods',
          title: 'A D2C storefront for a millet-powered snack brand',
          industry: 'retail-commerce',
          capabilities: ['digital-product-engineering'],
          image: '/images/crave_better_site.webp',
          screenshot: '/images/crave_better_site.webp',
          url: 'https://cravebetter4u.com/',
          status: 'Live',
          flagship: true,
          summary: 'Crave Better makes snacks from clean Indian superfoods that taste like a treat and work like food. Srinishtha built its direct-to-consumer storefront, giving the brand one place to tell its story, sell its range and take bulk orders.',
          challenge: 'A young food brand competing on shelves and marketplaces needed its own channel: a storefront that carried the brand personality, explained the nutrition clearly and let customers buy directly, while also capturing larger bulk and corporate orders.',
          approach: [
            'Brand-led home page that leads with the product promise and nutrition benefits',
            'Product catalogue with cart and a direct Shop Now purchase journey',
            'Bulk-order enquiry flow for corporate and wholesale buyers',
            'Gallery, testimonials and FAQs to build trust before purchase',
            'Responsive, SEO-ready build that the team can keep updating'
          ],
          outcome: 'A live D2C storefront that presents Crave Better with the same care as its products, with retail purchase and bulk enquiries handled in one place.'
        },
        {
          slug: 'tenju-tofu',
          client: 'Tenju Tofu',
          title: 'Subscriptions and D2C ordering for a fresh tofu brand',
          industry: 'retail-commerce',
          capabilities: ['digital-product-engineering'],
          image: '/images/tenjutofu_ss.webp',
          screenshot: '/images/tenjutofu_ss.webp',
          url: 'https://tofu.snst.cloud/',
          status: 'Live',
          flagship: true,
          summary: 'Tenju Tofu makes fresh, plant-based tofu daily. Srinishtha built its direct-to-consumer platform, combining one-off orders, recurring subscriptions and recipe content so customers buy fresh and come back.',
          challenge: 'Fresh tofu has a short shelf life, so the brand needed customers to order regularly rather than occasionally, and to understand how to cook with it. That meant subscriptions, accounts and content in one place.',
          approach: [
            'Product catalogue with cart for one-off orders',
            'Subscription plans for regular fresh deliveries',
            'Customer accounts and login to manage orders and subscriptions',
            'Recipes and brand story to build everyday habits',
            'Responsive build that keeps the fresh, natural brand front and centre'
          ],
          outcome: 'A live platform where Tenju Tofu sells, subscribes and educates customers from a single storefront.'
        },
        {
          slug: 'tirupati-shankara-mutt',
          client: 'Tirupati Shankara Mutt',
          title: 'A governed digital platform for a spiritual institution',
          industry: 'institutions',
          capabilities: ['workflow-automation', 'enterprise-software-engineering'],
          image: '/images/cs1.jpg',
          status: 'Demo delivered · project on hold',
          flagship: false,
          summary: 'Srinishtha architected a complete digital platform for Tirupati Shankara Mutt, enabling efficient local temple management and designed to integrate with the Sringeri Sharada Peetham (the main branch) for centralized governance and oversight.',
          challenge: 'The institution needed a platform that maintained spiritual authenticity while modernizing operations, handled multiple roles from devotees to administrators, supported multilingual content and enabled future integration with other Mutt branches.',
          approach: [
            'Online Pooja booking with flexible date and time management',
            'Room reservation system for visiting devotees and volunteers',
            'Secure donation gateway with automated receipt generation',
            'Multilingual CMS for the local Mutt team',
            'Integration hooks for centralized monitoring by Sringeri Mutt',
            'Admin command panel for head-office branch configuration',
            'History and legacy pages to preserve institutional heritage'
          ],
          outcome: 'A full demo with working UI and backend logic was delivered, demonstrating accessibility, multilingual support, role-based administration and an API-based architecture for future branch integrations.'
        },
        {
          slug: 'kouno-dolls',
          client: 'Kouno Dolls (幸運を)',
          title: 'A self-owned D2C platform worthy of handcrafted heritage',
          industry: 'retail-commerce',
          capabilities: ['digital-product-engineering'],
          image: '/images/cs3.jpg',
          screenshot: '/images/kounodolls_ss.png',
          url: 'http://kounodolls.com/',
          status: 'In development',
          flagship: false,
          summary: 'Kouno Dolls, a premium Japanese doll brand based in Hyderabad, wanted a refined, self-owned D2C platform that matched the emotional and artistic value of every handcrafted doll, without the constraints of mass marketplaces.',
          challenge: 'The brand needed full creative and operational control, a site that reflected heritage and authenticity, an intuitive backend for content and inventory, and secure payments with strong SEO fundamentals.',
          approach: [
            'Elegant, Japanese-inspired design reflecting the premium aesthetic',
            'Custom shopping experience with integrated payments and simple product flows',
            'CMS for storytelling: the meaning behind each creation',
            'SEO-first architecture for organic discovery and long-term growth',
            'Built to scale for gifting, product drops and international access'
          ],
          outcome: 'A D2C foundation giving the brand complete control over presentation and product curation.'
        },
        {
          slug: 'education-erp',
          client: 'Srinishtha Labs',
          title: 'Rethinking ERP for real-world school life',
          industry: 'education',
          capabilities: ['workflow-automation', 'digital-product-engineering'],
          image: '/images/cs5.jpg',
          status: 'In development',
          summary: 'Most education ERPs are underused. We are building a human-centred school ERP that teachers, parents, drivers and administrators actually adopt.',
          challenge: 'Teachers find existing tools unintuitive, parents engage only for fees, drivers fall back on manual coordination and back-office teams rely on spreadsheets despite having technology in place.',
          approach: [
            'Designed for adoption: tested with real school stakeholders',
            'Mobile-first and multilingual interface',
            'Modular and flexible: start simple, grow smart',
            'Insightful by design: built for visibility, not just data entry',
            'Role-specific views for actual user needs'
          ],
          outcome: 'Teachers manage classes with ease, parents receive contextual updates, drivers use tap-friendly offline interfaces and leadership gains real-time visibility.'
        },
        {
          slug: 'hospitality-supply',
          client: 'Grocery distributor (confidential)',
          title: 'Inclusive, AI-assisted ordering for hospitality supply',
          industry: 'retail-commerce',
          capabilities: ['ai-intelligent-systems', 'digital-product-engineering'],
          image: '/images/cs4.jpg',
          status: 'Blueprint delivered',
          summary: 'An exporter and importer with a strong grocery distribution network wanted hotels and restaurants to order through a simple, intelligent interface, even when users are under-digitized or speak regional languages.',
          challenge: 'The app had to work for users with limited literacy and language diversity, accept imprecise or verbal-style requests, run in low-connectivity areas and integrate with existing inventory and logistics.',
          approach: [
            'Natural-language friendly ordering that accepts partial or spoken-like queries',
            'Multilingual UI with visual ordering assistance',
            'Quick repeat orders with intuitive history recall',
            'Offline-first design for rural and semi-urban use',
            'Backend-ready architecture for future API integrations'
          ],
          outcome: 'A full UX concept, feature breakdown, high-level architecture and timeline/costing roadmap, well received by the client, with implementation discussions ongoing.'
        },
        {
          slug: 'career-accelerator',
          client: 'Srinishtha Labs',
          title: 'A career accelerator for Tier 2 & Tier 3 talent',
          industry: 'education',
          capabilities: ['digital-product-engineering'],
          image: '/images/cs6.jpg',
          status: 'Pilot batches running',
          summary: 'Talented students from Tier 2 and Tier 3 cities lack exposure, mentorship and tools. We are building an internship and mentorship platform that equips them to build independently.',
          challenge: 'Expensive, outdated training; little mentorship or product-thinking exposure; no real-world projects; and no consistent way to track progress.',
          approach: [
            'Foundational computer science and full-stack curriculum',
            'Mentorship by working professionals',
            'Live projects and assessments with real feedback',
            'Onboarding and progress-tracking platform',
            'Alumni network and community'
          ],
          outcome: 'Pilot participants are contributing to real projects, with deeply positive early feedback.'
        },
        {
          slug: 'professional-platforms',
          client: 'Srinishtha Labs',
          title: 'A platform factory for professionals and MSMEs',
          industry: 'professional-services',
          capabilities: ['digital-product-engineering', 'enterprise-software-engineering'],
          image: '/images/cs7.jpg',
          status: 'Pilots in progress',
          summary: 'Doctors, consultants, trainers and small businesses need a branded platform that books, collects payments and builds trust, without managing code.',
          challenge: 'Most professionals have no site or an outdated one, lack booking and payment tools, and depend on marketplaces that own the client relationship.',
          approach: [
            'Professional portfolios with unique branding and content',
            'Booking and scheduling, payments, testimonials and reviews',
            'CMS dashboard to update content without tech support',
            'Add-ons for newsletters, lead generation, SEO and WhatsApp chat',
            'Mobile-first, multilingual and deployable in hours'
          ],
          outcome: 'Pilot platforms are being refined with real professionals, including Dr. Laxminadh Sivaraju and Dr. Prathusha Nerella.'
        }
      ],

      projects: [
        { client: 'Comfort Cool Systems', category: 'Enterprise · Inventory', screenshot: '/images/comfort_cool_login.webp', url: 'https://daikin.snst.cloud/', caseStudy: 'comfort-cool-systems', description: 'Inventory Suite tracking stock across three warehouses in real time, with role-based access for distributors.' },
        { client: 'Crave Better Foods', category: 'D2C Commerce', screenshot: '/images/crave_better_site.webp', url: 'https://cravebetter4u.com/', caseStudy: 'crave-better', description: 'Storefront for a millet-powered snack brand, with direct purchase and bulk-order enquiries.' },
        { client: 'Tenju Tofu', category: 'D2C Commerce', screenshot: '/images/tenjutofu_ss.webp', url: 'https://tofu.snst.cloud/', caseStudy: 'tenju-tofu', description: 'Fresh tofu platform with one-off orders, subscriptions, customer accounts and recipes.' },
        { client: 'Soham Academy', category: 'EdTech', screenshot: '/images/soham_ss.webp', url: 'https://www.sohamrobotics.org/app', description: 'Digital presence for a robotics education institution, enabling student engagement and programme visibility.' },
        { client: 'Grameena Vidhya Jyothi Bharath', category: 'Education', screenshot: '/images/gvjb_ss.webp', url: 'https://gvjb.in/', description: 'Digital platform empowering rural education, connecting students, teachers and communities across Bharat.' },
        { client: 'Kalaguragampa', category: 'E-Commerce', screenshot: '/images/kalaguragampa_ss.webp', url: 'http://kalaguragampa.com/', description: 'Full-featured e-commerce platform with seamless online shopping and order management.' },
        { client: 'Sri Ramanavami', category: 'Events', screenshot: '/images/sri_rama_navami_ss.webp', url: 'https://www.sriramanavami.com/', description: 'Platform for the Sri Ramanavami celebrations, handling registrations and event information.' },
        { client: 'Elevate Together', category: 'Career Development', screenshot: '/images/elevatetogether_ss.webp', url: 'https://www.elevatetogether.in/', description: 'Career enablement platform connecting aspiring professionals with mentors and opportunities.' },
        { client: 'Dr. Laxminadh Sivaraju', category: 'Professional Portfolio', screenshot: '/images/dr_laxmi_nadh_ss.webp', url: 'https://drlaxminadhneurocare.in/', description: 'Professional platform showcasing the expertise of a leading medical professional.' },
        { client: 'Dr. Prathusha Nerella', category: 'Professional Portfolio', screenshot: '/images/dr_prathusha_ss.webp', url: 'http://drprathushanerella.com/', description: 'Practice showcase designed to build trust with patients and peers.' },
        { client: 'Innomayi', category: 'Mobile App', screenshot: '/images/innomayi_ss.jpeg', device: 'mobile', url: nil, description: 'Feature-rich mobile application delivering a seamless experience across Android and iOS.' },
        { client: 'Opulent', category: 'Web App', screenshot: '/images/opulent_ss.png', url: nil, description: "Polished digital experience reflecting the brand's premium identity." },
        { client: 'Vardhaman Bank', category: 'Financial Services', screenshot: '/images/vardhaman_bank_ss.webp', url: 'https://vardhamanbankui.netlify.app/', description: 'Clean, professional digital presence for Vardhaman Bank.' }
      ],

      testimonials: [
        {
          key: 'sids-farm',
          quote: 'The incredible support and expertise provided by the team, especially Sathish, have been instrumental in stabilizing our mobile application and rolling out key features. Their dedication has ensured our platform is robust and capable of handling thousands of simultaneous users.',
          author: 'Sunil Potturi',
          role: "CTO, Sid's Farm",
          logo: '/images/sidsfarm.webp'
        }
      ],

      leadership: [
        { name: 'Jayaprakash Sivaraju', role: 'CEO', bio: 'Leads with vision and heart. Balances business, team energy, and staying hands-on with what matters most: the product.' },
        { name: 'Sathish Pasupunuri', role: 'CTO', bio: "Leads engineering and delivery, including the stabilization and scale-up of Sid's Farm. The calm compass behind the scenes, with a strong pulse on the long game." },
        { name: 'Subrahmanyam Tamma', role: 'CMO', bio: 'Storyteller, strategist and the voice of the brand. Believes every product should have personality and purpose.' },
        { name: 'Aruna Mytrayee Challa', role: 'Co-Founder', bio: 'A big-picture thinker who helped shape the roots of Srinishtha. Always curious, always building.' },
        { name: 'Ujwala Pasupunuri', role: 'Co-Founder', bio: 'Committed from day one to bringing technology with meaning into the world. Believes in people before processes.' }
      ],

      enterpriseExperience: {
        eyebrow: 'Built on experience',
        title: 'Where our experience comes from',
        lede: 'Before founding Srinishtha, our team led large-scale solutions that ran real operations and critical infrastructure. That experience now powers everything we build.',
        domains: [
          { title: 'Telecom & network systems', text: 'Provisioning and billing platforms for large-scale telecom ecosystems, with OSS/BSS architecture experience.' },
          { title: 'Governance, risk & compliance', text: 'GRC frameworks and workflows for enterprise environments, focused on secure data handling.' },
          { title: 'RFID & port logistics', text: 'An RFID-based, real-time vehicle tracking system for a major Indian port.' },
          { title: 'Integration & API architecture', text: 'API-first systems integrating with Bloomberg and finance workflows.' },
          { title: 'Enterprise platform design', text: 'Ground-up design of scalable, secure platforms used across continents.' }
        ]
      },

      team: [
        { name: 'Sirisha', role: 'Full Stack Developer', photo: '/images/sirisha.jpeg' },
        { name: 'Preethi', role: 'Full Stack Developer', photo: '/images/preethi.jpeg' },
        { name: 'Vaishnavi', role: 'Full Stack Developer', photo: '/images/vaishnavi.jpeg' },
        { name: 'Shri Harshie', role: 'Full Stack Developer', photo: '/images/harshie.jpeg' },
        { name: 'Jhansi', role: 'Full Stack Developer', photo: '/images/jhansi.jpeg' },
        { name: 'Surya Sravani', role: 'Full Stack Developer', photo: '/images/sravani.jpeg' }
      ],

      principles: [
        { title: 'We stay until it works', text: 'Delivery does not end at launch. We stabilize, support and improve until the platform performs in the real world.' },
        { title: 'Senior attention on every engagement', text: 'Leaders stay hands-on. We treat every deadline, every line of code and every release as if our own business depended on it.' },
        { title: 'The truth about scope, time and risk', text: 'No overselling and no shortcuts. Transparent estimates, a visible risk log and honest status reporting.' }
      ],

      timeline: [
        { date: '2024', title: 'Laying the foundation', text: 'Built a lean, cross-functional team and turned our first D2C and AgriTech ideas into paying projects.' },
        { date: '2025', title: 'Proving the model', text: 'Shipped real-world platforms with Kalaguragampa, Soham Academy and Dr. Prathusha Nerella, refining our delivery playbook.' },
        { date: '2026', title: 'Expanding impact', text: 'Scaled into cultural, social and rural-education initiatives with Sri Ramanavami, Elevate Together and Grameena Vidhya Jyothi Bharath.' },
        { date: 'Next', title: 'Productizing our learnings', text: 'Turning reusable engineering into products (EduERP and Adhyaapak) for education management and career enablement.' }
      ],

      products: {
        eyebrow: 'Srinishtha Labs',
        title: 'Our products',
        lede: 'Srinishtha Labs is where we turn lessons from client work into products of our own, built on the same framework we use for clients.',
        items: [
          { name: 'Adhyaapak', tagline: 'The professional network for educators', status: 'Live', logo: '/images/aadhyapak_logo.png', screenshot: '/images/aadhyapak_ss.webp', text: 'A dedicated professional networking platform for teachers, build profiles, share achievements, discover opportunities, connect with schools and grow a career in education.' },
          { name: 'Fine Arts Platform', tagline: 'Showcase your art. Build your brand.', status: 'In development', screenshot: '/images/finearts_ss.webp', text: 'A premium platform celebrating the fine arts, connecting artists, enthusiasts and institutions in a beautifully crafted digital space.' },
          { name: 'EduERP', tagline: 'The school ERP people actually use', status: 'In development', screenshot: '/images/cs5.jpg', device: 'photo', caseStudy: 'education-erp', text: 'A human-centred, mobile-first, multilingual school ERP with role-specific views for teachers, parents, drivers and administrators.' },
          { name: 'Career Accelerator', tagline: 'Industry-ready skills for Tier 2 & Tier 3 talent', status: 'Pilot batches running', screenshot: '/images/cs6.jpg', device: 'photo', caseStudy: 'career-accelerator', text: 'An internship and mentorship platform with a full-stack curriculum, mentoring by working professionals, live projects, progress tracking and an alumni community.' },
          { name: 'Professional & MSME Platform', tagline: 'A branded, bookable website in hours', status: 'Pilots in progress', screenshot: '/images/cs7.jpg', device: 'photo', caseStudy: 'professional-platforms', text: 'A platform factory for doctors, consultants, trainers and small businesses: portfolios, booking, payments, testimonials and a CMS they manage themselves.' }
        ]
      },

      careers: {
        eyebrow: 'Careers',
        title: 'Careers at Srinishtha',
        lede: 'We hire engineers, designers and product people in Hyderabad, and run an internship programme for early-career developers.',
        perks: [
          { title: 'Growth & learning', text: 'Training, workshops and mentorship programmes that help you level up fast.' },
          { title: 'Real engineering from day one', text: 'Work on live client platforms and products that solve real problems for real people.' },
          { title: 'Work-life balance', text: 'Flexible arrangements and thoughtful policies that support your well-being.' },
          { title: 'Expanding horizons', text: "We're scaling across sectors, and soon across borders. Grow with us from the ground floor." },
          { title: 'Career development', text: 'Clear progression paths, leadership opportunities and a culture that celebrates your wins.' },
          { title: 'Benefits', text: 'Health benefits, performance incentives and perks that show we genuinely care.' }
        ],
        ctaLede: 'Send us your resume and a note about the work you are proud of. We reply to every application.',
        roles: ['Full Stack Development', 'UI/UX Design', 'Product Management', 'Business Development', 'Internships & Early Careers'],
        hiringProcess: [
          { title: 'Apply', text: 'Share your resume and the work you are proud of.' },
          { title: 'Conversation', text: 'A friendly call about your goals and our projects.' },
          { title: 'Practical exercise', text: 'A short, realistic task, with no trick questions.' },
          { title: 'Offer', text: 'Meet the team and get a clear, written offer.' }
        ],
        gallery: [
          { title: 'Our office', image: '/images/office-space.jpeg', span: 'wide' },
          { title: "Women's Day", image: '/images/women-day.jpeg' },
          { title: 'Team lunch', image: '/images/team-lunch.jpeg' },
          { title: 'Birthday celebrations', image: '/images/birthday.jpg' },
          { title: 'Team outing', image: '/images/team-outing.jpg', span: 'wide' },
          { title: 'Awards & recognition', image: '/images/awards.jpeg' },
          { title: 'New Year', image: '/images/new_year.jpeg' }
        ],
        voices: [
          { author: 'Sirisha', role: 'Full Stack Developer', photo: '/images/sirisha.jpeg', quote: 'The team is warm, professional, and always there when you need help. Truly a great place to build yourself.' },
          { author: 'Shri Harshie', role: 'Intern', photo: '/images/harshie.jpeg', quote: 'My first real work experience. Positive, helpful, and no one makes you feel small for asking questions. My opinions mattered here.' }
        ]
      },

      insights: {
        eyebrow: 'Insights',
        title: 'Insights',
        lede: 'Articles from the engineers and consultants who build our platforms. The first pieces are in preparation; these are the subjects we will cover.',
        pillars: [
          { title: 'Workflow automation', topics: ['How to identify automation candidates', 'Approvals vs orchestration', 'Designing for auditability', 'Measuring workflow ROI'] },
          { title: 'Enterprise AI', topics: ['RAG patterns that hold up in production', 'AI agents with guardrails', 'Document intelligence', 'Human-in-the-loop design', 'Evaluating AI systems'] },
          { title: 'Software engineering', topics: ['Scaling transactional systems', 'API design', 'Observability', 'Multi-tenant architecture'] },
          { title: 'Product engineering', topics: ['MVP vs scalable foundation', 'Rescuing struggling products', 'Design systems', 'Product analytics'] },
          { title: 'Industry', topics: ['Education operations', 'D2C at scale', 'Dairy and agri workflows', 'Customer and partner portals'] }
        ]
      },

      contactForm: {
        title: 'Discuss your transformation',
        lede: 'Tell us what you are trying to achieve. A senior member of our team reads every message and responds within one business day.',
        privacy: 'We use your details only to respond to this enquiry. We never sell or share your information.',
        options: {
          interest: [
            { value: 'enterprise', label: 'Enterprise software' },
            { value: 'automation', label: 'Workflow automation' },
            { value: 'ai', label: 'AI & intelligent systems' },
            { value: 'product', label: 'Digital product engineering' },
            { value: 'modernization', label: 'Cloud & modernization' },
            { value: 'other', label: 'Something else' }
          ],
          stage: [
            { value: 'exploring', label: 'Exploring ideas' },
            { value: 'scoped', label: 'Scoped and ready' },
            { value: 'existing', label: 'Improving an existing system' },
            { value: 'rescue', label: 'Rescue / modernization' }
          ],
          timeline: [
            { value: 'now', label: 'As soon as possible' },
            { value: 'quarter', label: 'This quarter' },
            { value: 'half', label: 'In the next 6 months' },
            { value: 'later', label: 'Later / not sure' }
          ]
        }
      },

      labels: {
        capability: { eyebrow: 'Capability', deliver: 'What we deliver', work: 'Related work', solutions: 'Where it applies', all: 'Capabilities' },
        caseStudy: { eyebrow: 'Case study', summary: 'Summary', challenge: 'The challenge', approach: 'What we delivered', outcome: 'Outcome', client: 'Client', industry: 'Industry', status: 'Status', capabilities: 'Capabilities', visit: 'Visit the live platform', more: 'More case studies', all: 'Work' },
        work: { flagship: 'Flagship case studies', more: 'More case studies', archive: 'Project archive', archiveLede: 'Websites, apps and portfolios delivered for clients across sectors.' },
        solutions: { proof: 'What we show you', view: 'View solution' },
        solution: {
          eyebrow: 'Solution', all: 'Solutions', problems: 'Problems we solve', before: 'Today', after: 'With Srinishtha',
          compare: 'What changes', modules: 'Built from the Srinishtha Framework', modulesLede: 'Proven modules we configure for this solution, so engineering time goes into what is specific to you.',
          work: 'Related work', phases: 'How we implement it',
          steps: [
            { title: 'Discover', text: 'Map the current process, the people involved and how success will be measured.' },
            { title: 'Configure', text: 'Assemble the framework modules and agree screens, rules and data together.' },
            { title: 'Build & integrate', text: 'Engineer the parts specific to you and connect your existing systems.' },
            { title: 'Pilot', text: 'Run with a small group, measure, and refine before scaling.' },
            { title: 'Roll out & support', text: 'Launch to everyone, train teams and keep improving.' }
          ],
          security: 'Integration & security',
          securityText: 'Role-based access, audit trails and encrypted data come as standard. We connect to your ERP, CRM, payment and identity systems through secure APIs, and you own the code.',
          securityLink: { label: 'Security & engineering practice', to: '/security' }
        },
        industries: { caseStudies: 'Case study' },
        about: { principles: 'Operating principles', principlesTitle: 'What you can expect from us', leadership: 'Leadership', leadershipTitle: 'The people accountable for your project', team: 'The builders', teamTitle: 'Our Team', timeline: 'Our story', timelineTitle: 'From first project to products', clients: 'Clients', clientsTitle: 'Organisations we work with' },
        careers: { perks: 'Why join us', perksTitle: 'What working here is like', roles: 'Open roles', rolesTitle: 'We are always hiring for', rolesLede: 'No opening that fits? Send your resume anyway and we will reach out when something matches.', process: 'Hiring process', processTitle: 'Four steps, no surprises', life: 'Life at Srinishtha', lifeTitle: 'The office and the people', voices: 'In their words' },
        contact: { reach: 'Reach us directly', email: 'Email', phone: 'Phone', office: 'Office' },
        products: { caseStudy: 'Read the story' },
        notFound: { eyebrow: '404', heading: 'This page does not exist.', lede: 'The link may be out of date. These pages are a good place to start:' }
      },

      pages: {
        home: { title: 'Srinishtha Technologies — Enterprise software, workflow automation & applied AI', description: 'Enterprise software, intelligent workflow automation and AI-enabled digital platforms engineered for scale, from Hyderabad.' },
        capabilities: { title: 'Capabilities', description: 'Enterprise software engineering, workflow automation, AI & intelligent systems, digital product engineering and cloud modernization.', eyebrow: 'Capabilities', heading: 'What we do', lede: 'Five areas of practice, delivered by one senior team on a shared engineering foundation.' },
        solutions: { title: 'Solutions', description: 'Solutions for operations automation, enterprise portals, education, commerce, AI assistants and document workflows.', eyebrow: 'Solutions', heading: 'Solutions by business problem', lede: 'Each solution combines modules from the Srinishtha Technology Framework with engineering tailored to your operation.' },
        industries: { title: 'Industries', description: 'Industry experience across agriculture & dairy, retail & commerce, education, institutions, professional services and financial services.', eyebrow: 'Industries', heading: 'Industries we serve', lede: 'The sectors where we have delivered platforms, and the operational problems we usually help with in each.' },
        work: { title: 'Work', description: "Case studies from Sid's Farm, Tirupati Shankara Mutt, Kouno Dolls and more.", eyebrow: 'Selected work', heading: 'Selected work', lede: 'Detailed case studies first, followed by an archive of other platforms we have shipped.' },
        products: { title: 'Products — Srinishtha Labs', description: 'Adhyaapak, Fine Arts Platform and EduERP from Srinishtha Labs.' },
        about: { title: 'About', description: 'Founded in 2024, built on more than 100 years of combined technology and business experience.', eyebrow: 'Company', heading: 'About Srinishtha', lede: 'Srinishtha Technologies was founded in Hyderabad in 2024 by a leadership team with more than 100 years of combined experience in telecom, logistics, compliance and enterprise software. We started the company to deliver enterprise-grade engineering to organisations that are usually underserved by large IT firms.' },
        leadership: { title: 'Leadership', description: 'The people who lead Srinishtha Technologies, the enterprise experience behind them, and our team.', eyebrow: 'Company', heading: 'Leadership', lede: 'Senior people who stay hands-on with every engagement, backed by experience from critical enterprise systems.' },
        howWeWork: { title: 'How We Work', description: 'Our delivery model and operating principles.', eyebrow: 'Company', heading: 'How we work', lede: 'A predictable delivery model with senior involvement from the first conversation to long after launch.' },
        security: { title: 'Security & Engineering', description: 'How Srinishtha secures, tests, operates and supports the platforms it builds.' },
        life: { title: 'Life at Srinishtha', description: 'The office, the celebrations and the people of Srinishtha Technologies in Hyderabad.', eyebrow: 'Company', heading: 'Life at Srinishtha', lede: 'We work hard, celebrate together and look out for each other. A glimpse of our day-to-day in Hyderabad.' },
        careers: { title: 'Careers', description: 'Join Srinishtha Technologies in Hyderabad, full stack, design, product and internships.' },
        insights: { title: 'Insights', description: 'Perspectives on workflow automation, enterprise AI, software and product engineering.' },
        contact: { title: 'Contact', description: 'Discuss your transformation with Srinishtha Technologies.', eyebrow: 'Contact' },
        privacy: { title: 'Privacy', description: 'How Srinishtha Technologies handles personal information submitted through this website.', eyebrow: 'Legal', heading: 'Privacy', lede: 'When you contact us we store the details you submit (name, work email, company, role, message and campaign source) solely to respond to your enquiry and manage the resulting relationship. We do not sell or share this information. To access or delete your data, email info@srinishtha.com.' },
        notFound: { title: 'Page not found', description: 'This page does not exist.' }
      }
    }.freeze

    # Blocks edited from the admin panel. The seed only creates them if missing, so
    # re-seeding never wipes admin work. Use `rake db:seed FORCE=1` to overwrite them too.
    ADMIN_MANAGED = %i[projects caseStudies].freeze

    def self.run!(force: ENV['FORCE'] == '1')
      BLOCKS.each_with_index do |(key, payload), position|
        keep_existing = ADMIN_MANAGED.include?(key) && !force
        App::Models::ContentBlock.dataset.insert_conflict(
          target: :key,
          update: keep_existing ? { position: Sequel[:excluded][:position] } : { payload: Sequel[:excluded][:payload], position: Sequel[:excluded][:position], updated_at: Sequel::CURRENT_TIMESTAMP }
        ).insert(key: key.to_s, payload: Sequel.pg_jsonb(payload), position: position)
      end
      BLOCKS.size
    end
  end
end
